#!/bin/bash

# ============================================================================
# BUILD SCRIPT FOR UNIFIED THESIS TEMPLATE
# ============================================================================
#
# Compiles thesis.tex dalam 3 mode berbeda
#
# Penggunaan:
#   ./build-thesis.sh                    # Compile semua 3 mode
#   ./build-thesis.sh sidang             # Compile sidang saja
#   ./build-thesis.sh sempro             # Compile sempro saja
#   ./build-thesis.sh semhas             # Compile semhas saja
#   ./build-thesis.sh clean              # Hapus file temporary
#   ./build-thesis.sh watch              # Watch mode
#
# ============================================================================

set -e

# Add TeX Live to PATH
export PATH="/usr/local/texlive/2025/bin/universal-darwin:$PATH"

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$PROJECT_DIR"

# Color output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Compiler settings
COMPILER="xelatex"
COMPILER_OPTS="-interaction=nonstopmode -file-line-error -synctex=1"
BIBER="biber"

# Modes
declare -a MODES=("sempro" "semhas" "sidang")

# ============================================================================
# FUNCTIONS
# ============================================================================

compile_mode() {
  local mode=$1
  local outname=$mode
  
  echo -e "\n${BLUE}═══════════════════════════════════════════════════════${NC}"
  echo -e "${BLUE}Compiling THESIS Mode: ${YELLOW}${mode}${BLUE}${NC}"
  echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}\n"
  
  # First xelatex run
  echo -e "${GREEN}[1/4] First XeLaTeX pass...${NC}"
  $COMPILER $COMPILER_OPTS --jobname="$outname" "\def\thesismode{$mode}\input{thesis.tex}" > /dev/null 2>&1 || {
    echo -e "${RED}✗ First pass failed${NC}"
    return 1
  }
  echo -e "${GREEN}✓ First pass done${NC}"
  
  # Biber bibliography
  echo -e "${GREEN}[2/4] Running Biber...${NC}"
  if [ -f "${outname}.bcf" ]; then
    $BIBER "$outname" > /dev/null 2>&1 || {
      echo -e "${RED}✗ Biber failed${NC}"
      return 1
    }
    echo -e "${GREEN}✓ Bibliography processed${NC}"
  fi
  
  # Second xelatex run
  echo -e "${GREEN}[3/4] Second XeLaTeX pass...${NC}"
  $COMPILER $COMPILER_OPTS --jobname="$outname" "\def\thesismode{$mode}\input{thesis.tex}" > /dev/null 2>&1 || {
    echo -e "${RED}✗ Second pass failed${NC}"
    return 1
  }
  echo -e "${GREEN}✓ Second pass done${NC}"
  
  # Third xelatex run (for cross-references)
  echo -e "${GREEN}[4/4] Third XeLaTeX pass...${NC}"
  $COMPILER $COMPILER_OPTS --jobname="$outname" "\def\thesismode{$mode}\input{thesis.tex}" > /dev/null 2>&1 || {
    echo -e "${RED}✗ Third pass failed${NC}"
    return 1
  }
  echo -e "${GREEN}✓ Third pass done${NC}"
  
  # Check if PDF was created
  if [ -f "${outname}.pdf" ]; then
    echo -e "\n${GREEN}✓ Successfully created: ${outname}.pdf${NC}\n"
    return 0
  else
    echo -e "\n${RED}✗ PDF not created${NC}\n"
    return 1
  fi
}

clean_files() {
  echo -e "\n${BLUE}Cleaning up temporary files...${NC}\n"
  
  for mode in "${MODES[@]}"; do
    rm -f "$mode".{aux,bbl,blg,idx,ind,lof,lot,out,toc,acn,acr,alg,glg,glo}
    rm -f "$mode".{fls,log,fdb_latexmk,snm,synctex.gz,dpth,md5,auxlock}
    rm -f "$mode".{bcf,run.xml,apc}
  done
  
  echo -e "${GREEN}✓ Cleanup done${NC}\n"
}

watch_mode() {
  echo -e "\n${BLUE}Watch mode - compile on file changes${NC}"
  echo -e "${BLUE}(Using latexmk)${NC}\n"
  
  # Use latexmk for watch mode
  latexmk -xelatex -synctex=1 -interaction=nonstopmode -pvc -jobname="sidang" "\def\thesismode{sidang}\input{thesis.tex}"
}

# ============================================================================
# MAIN
# ============================================================================

case "${1:-all}" in
  
  sempro)
    compile_mode "sempro"
    ;;
    
  semhas)
    compile_mode "semhas"
    ;;
    
  sidang)
    compile_mode "sidang"
    ;;
    
  all)
    SUCCESS=0
    FAILED=0
    
    for mode in "${MODES[@]}"; do
      if compile_mode "$mode"; then
        ((SUCCESS++))
      else
        ((FAILED++))
      fi
    done
    
    echo -e "\n${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}SUMMARY${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "  ${GREEN}Success: $SUCCESS${NC}"
    if [ $FAILED -gt 0 ]; then
      echo -e "  ${RED}Failed: $FAILED${NC}"
    fi
    echo ""
    ;;
    
  clean)
    clean_files
    ;;
    
  watch)
    watch_mode
    ;;
    
  *)
    echo "Usage: $0 {sempro|semhas|sidang|all|clean|watch}"
    echo ""
    echo "Options:"
    echo "  sempro     Compile proposal (sempro) only"
    echo "  semhas     Compile result (semhas) only"
    echo "  sidang     Compile thesis (sidang) only"
    echo "  all        Compile all 3 modes (default)"
    echo "  clean      Remove temporary files"
    echo "  watch      Watch mode (auto-compile on changes)"
    exit 1
    ;;
    
esac

exit 0
