#!/bin/bash

###############################################################################
# PREPARE SUBMISSION SCRIPT
# Script untuk prepare dan package tugas akhir untuk submission ke FMIPA USK
#
# Copyright (c) 2025 BIRRUL WALIDAIN
# Repository: https://github.com/birrulwldain/Tesis-26msi
###############################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print functions
print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

print_step() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Check prerequisites
check_prerequisites() {
    print_header "Checking Prerequisites"
    
    if ! command -v xelatex &> /dev/null; then
        print_error "XeLaTeX not found. Please install TeX Live or MacTeX."
        exit 1
    fi
    print_step "XeLaTeX found: $(xelatex --version | head -n1)"
    
    if ! command -v bibtex &> /dev/null; then
        print_warning "BibTeX not found. Bibliography may not compile."
    else
        print_step "BibTeX found"
    fi
    
    if ! command -v zip &> /dev/null; then
        print_error "zip command not found. Please install zip utility."
        exit 1
    fi
    print_step "zip utility found"
    
    echo ""
}

# Clean previous builds
clean_build() {
    print_header "Cleaning Previous Build"
    
    if [ -f "clean.sh" ]; then
        bash clean.sh
        print_step "Cleaned using clean.sh"
    else
        # Manual cleanup
        rm -f *.aux *.log *.toc *.lof *.lot *.out *.bbl *.blg *.synctex.gz
        rm -f *.fdb_latexmk *.fls *.xdv
        print_step "Cleaned build artifacts manually"
    fi
    
    # Clean old submission package
    rm -rf submission/
    rm -f submission.zip
    print_step "Removed old submission package"
    
    echo ""
}

# Compile thesis
compile_thesis() {
    print_header "Compiling Thesis"
    
    print_step "Running XeLaTeX (1st pass)..."
    xelatex -interaction=nonstopmode thesis.tex > /dev/null 2>&1 || {
        print_error "XeLaTeX compilation failed. Check thesis.log for details."
        exit 1
    }
    
    print_step "Running BibTeX..."
    bibtex thesis > /dev/null 2>&1 || {
        print_warning "BibTeX had warnings. Check thesis.blg for details."
    }
    
    # Process nomenclature (symbol list) if present
    if [ -f "thesis.nlo" ]; then
        if command -v makeindex &> /dev/null; then
            print_step "Running makeindex for nomenclature..."
            makeindex thesis.nlo -s nomencl.ist -o thesis.nls > /dev/null 2>&1 || {
                print_warning "Nomenclature index generation had issues. Check thesis.nls."
            }
        else
            print_warning "makeindex not found. Nomenclature symbols may not appear correctly."
        fi
    fi
    
    print_step "Running XeLaTeX (2nd pass)..."
    xelatex -interaction=nonstopmode thesis.tex > /dev/null 2>&1
    
    print_step "Running XeLaTeX (3rd pass - final)..."
    xelatex -interaction=nonstopmode thesis.tex > /dev/null 2>&1
    
    if [ -f "thesis.pdf" ]; then
        print_step "PDF generated successfully: thesis.pdf"
        
        # Check PDF size
        size=$(du -h thesis.pdf | cut -f1)
        print_step "PDF size: $size"
        
        # Check page count
        if command -v pdfinfo &> /dev/null; then
            pages=$(pdfinfo thesis.pdf 2>/dev/null | grep "Pages:" | awk '{print $2}')
            if [ -n "$pages" ]; then
                print_step "Total pages: $pages"
            fi
        fi
    else
        print_error "PDF generation failed!"
        exit 1
    fi
    
    echo ""
}

# Verify PDF compliance
verify_pdf() {
    print_header "Verifying PDF Compliance"
    
    if command -v pdfinfo &> /dev/null; then
        print_step "PDF Info:"
        pdfinfo thesis.pdf | grep -E "(Title|Author|Pages|PDF version)" || true
    else
        print_warning "pdfinfo not available. Skipping detailed verification."
    fi
    
    # Check if fonts are embedded
    if command -v pdffonts &> /dev/null; then
        embedded=$(pdffonts thesis.pdf 2>/dev/null | tail -n +3 | awk '{if($6=="no") print $1}' | wc -l | tr -d ' ')
        if [ "$embedded" -eq "0" ]; then
            print_step "All fonts are embedded ✓"
        else
            print_warning "Some fonts may not be embedded"
        fi
    fi
    
    echo ""
}

# Create submission package
create_package() {
    print_header "Creating Submission Package"
    
    # Create submission directory
    mkdir -p submission
    print_step "Created submission directory"
    
    # Copy essential files
    cp thesis.pdf submission/
    print_step "Copied thesis.pdf"
    
    cp thesis.tex submission/
    print_step "Copied thesis.tex"
    
    cp daftar-pustaka.bib submission/
    print_step "Copied daftar-pustaka.bib"
    
    # Copy include files
    if [ -d "include" ]; then
        cp -r include/ submission/
        print_step "Copied include/ directory"
    fi
    
    # Copy images
    if [ -d "images" ]; then
        cp -r images/ submission/
        print_step "Copied images/ directory"
    fi
    
    # Copy lib files
    if [ -d "lib" ]; then
        cp -r lib/ submission/
        print_step "Copied lib/ directory"
    fi
    
    # Copy language files
    if [ -d "language" ]; then
        cp -r language/ submission/
        print_step "Copied language/ directory"
    fi
    
    # Copy style files
    if [ -d "style" ]; then
        cp -r style/ submission/
        print_step "Copied style/ directory"
    fi
    
    # Copy README files
    cp README.md submission/ 2>/dev/null || print_warning "README.md not found"
    cp SUBMIT_GUIDE.md submission/ 2>/dev/null || print_warning "SUBMIT_GUIDE.md not found"
    
    # Create build instructions
    cat > submission/BUILD_INSTRUCTIONS.txt << 'EOF'
CARA COMPILE THESIS
===================

Prasyarat:
- Install XeLaTeX (TeX Live atau MacTeX)
- Install BibTeX

Langkah Compile (Manual):
1. xelatex thesis
2. bibtex thesis
3. makeindex thesis.nlo -s nomencl.ist -o thesis.nls  (jika ada simbol)
4. xelatex thesis
5. xelatex thesis

Output: thesis.pdf

Atau gunakan script otomatis:
./prepare-submission.sh

Untuk pertanyaan, lihat README.md atau SUBMIT_GUIDE.md

Repository: https://github.com/birrulwldain/Tesis-26msi
EOF
    print_step "Created BUILD_INSTRUCTIONS.txt"
    
    echo ""
}

# Create ZIP archive
create_zip() {
    print_header "Creating ZIP Archive"
    
    cd submission
    zip -r ../submission.zip . > /dev/null 2>&1
    cd ..
    
    if [ -f "submission.zip" ]; then
        size=$(du -h submission.zip | cut -f1)
        print_step "Created submission.zip ($size)"
        
        # Verify zip
        if zip -T submission.zip > /dev/null 2>&1; then
            print_step "ZIP archive verified ✓"
        else
            print_warning "ZIP verification failed"
        fi
    else
        print_error "Failed to create submission.zip"
        exit 1
    fi
    
    echo ""
}

# Print summary
print_summary() {
    print_header "Submission Package Ready!"
    
    echo -e "${GREEN}📦 Package Contents:${NC}"
    echo "   - thesis.pdf (final PDF)"
    echo "   - thesis.tex + include files (source)"
    echo "   - daftar-pustaka.bib (bibliography)"
    echo "   - lib/ (template files)"
    echo "   - images/ (graphics)"
    echo "   - BUILD_INSTRUCTIONS.txt"
    echo ""
    
    echo -e "${GREEN}📂 Output Files:${NC}"
    echo "   - submission/ directory"
    echo "   - submission.zip"
    echo ""
    
    echo -e "${BLUE}📤 Next Steps:${NC}"
    echo "   1. Review thesis.pdf untuk memastikan semua benar"
    echo "   2. Login ke SIMATA: https://fmipa.usk.ac.id/simata/login"
    echo "   3. Upload thesis.pdf dan supporting documents"
    echo "   4. Lihat SUBMIT_GUIDE.md untuk checklist lengkap"
    echo ""
    
    echo -e "${YELLOW}⚠️  Important:${NC}"
    echo "   - Pastikan similarity check < 20%"
    echo "   - Lembar pengesahan harus ada signature"
    echo "   - Semua metadata di SIMATA harus lengkap"
    echo ""
    
    print_step "All done! Good luck with your submission! 🎓"
}

# Main execution
main() {
    clear
    echo ""
    print_header "FMIPA USK Thesis Submission Preparation"
    echo ""
    
    check_prerequisites
    clean_build
    compile_thesis
    verify_pdf
    create_package
    create_zip
    print_summary
}

# Run main function
main
