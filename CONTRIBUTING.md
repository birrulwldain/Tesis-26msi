# Contributing to USK FMIPA Thesis Template

Terima kasih atas minat Anda untuk berkontribusi pada template tugas akhir FMIPA Unsyiah! 🎉

---

## 📋 Cara Berkontribusi

### 1. Report Issues
Jika Anda menemukan bug atau masalah:
1. Cek [existing issues](https://github.com/birrulwldain/Tesis-26msi/issues) terlebih dahulu
2. Buat issue baru dengan informasi:
   - Deskripsi masalah yang jelas
   - Langkah-langkah untuk reproduce
   - Expected vs actual behavior
   - Screenshot (jika relevan)
   - Environment: OS, XeLaTeX version, etc.

### 2. Suggest Features
Untuk feature request:
- Buat issue dengan label `enhancement`
- Jelaskan use case dan benefit
- Berikan contoh implementasi jika memungkinkan

### 3. Submit Pull Request
1. Fork repository ini
2. Create feature branch: `git checkout -b feature/nama-fitur`
3. Commit changes: `git commit -m 'Add: deskripsi singkat'`
4. Push to branch: `git push origin feature/nama-fitur`
5. Open Pull Request dengan:
   - Deskripsi perubahan
   - Link ke issue terkait (jika ada)
   - Screenshot/demo (jika UI changes)

---

## 🎯 Guidelines

### Code Style
- **LaTeX**: Ikuti konvensi yang sudah ada di `usk-thesis-xelatex.sty`
- **Comments**: Bahasa Indonesia untuk dokumentasi user-facing
- **Naming**: Descriptive variable/command names
- **Formatting**: Konsisten dengan style existing files

### Testing
Sebelum submit PR, pastikan:
- [ ] `xelatex thesis.tex` compile tanpa error
- [ ] Bibliography generate dengan benar (bibtex/biber)
- [ ] PDF output sesuai format FMIPA
- [ ] Tidak ada breaking changes di existing features
- [ ] Test di minimal 2 OS (macOS/Linux/Windows)

### Documentation
- Update README.md jika menambah fitur baru
- Tambah/update comments di code
- Update SUBMIT_GUIDE.md jika ada perubahan workflow

---

## 🔧 Development Setup

### Prerequisites
```bash
# Install XeLaTeX
brew install --cask mactex-no-gui  # macOS
sudo apt install texlive-xetex biber  # Linux

# Clone repository
git clone https://github.com/birrulwldain/Tesis-26msi.git
cd Tesis-26msi
```

### Build & Test
```bash
# Clean build
./clean.sh

# Build thesis
xelatex thesis
bibtex thesis
xelatex thesis
xelatex thesis

# Verify output
open thesis.pdf  # macOS
xdg-open thesis.pdf  # Linux
```

### Project Structure
```
.
├── thesis.tex              # Main document
├── lib/
│   └── usk-thesis-xelatex.sty  # Core template package
├── include/                # Chapter files
├── images/                 # Graphics
├── daftar-pustaka.bib     # Bibliography
└── README.md              # Documentation
```

---

## 🎨 Areas for Contribution

### High Priority
- [ ] Improve bibliography styles (APA, IEEE, etc.)
- [ ] Add more examples in chapters
- [ ] Enhance error messages for common issues
- [ ] Add GitHub Actions for automated testing
- [ ] Create VS Code snippets for common patterns

### Medium Priority
- [ ] Support for additional languages (English-only thesis)
- [ ] Template for other FMIPA programs (S2, S3)
- [ ] Better handling of large documents (>100 pages)
- [ ] Integration with reference managers (Zotero, Mendeley)

### Nice to Have
- [ ] Web-based template configurator
- [ ] Docker image for consistent builds
- [ ] Overleaf template version
- [ ] Video tutorials

---

## 📝 Commit Message Convention

Format: `Type: Short description`

**Types**:
- `Add`: New feature atau file
- `Fix`: Bug fix
- `Update`: Update existing feature
- `Remove`: Hapus file/feature
- `Docs`: Documentation changes
- `Style`: Format, spacing, etc (no code change)
- `Refactor`: Code restructuring
- `Test`: Add/update tests

**Examples**:
```
Add: Support for multiple bibliography styles
Fix: Page numbering issue in appendix
Update: Margin settings to match 2024 guidelines
Docs: Add troubleshooting section in README
```

---

## 🏆 Recognition

Contributors akan dicantumkan di:
- README.md (Contributors section)
- Release notes
- Package header (major contributors)

---

## 📞 Questions?

- **GitHub Issues**: https://github.com/birrulwldain/Tesis-26msi/issues
- **Email**: [Jika tersedia, tambahkan email kontak]
- **Discussions**: Use GitHub Discussions untuk pertanyaan umum

---

## 📄 License

By contributing, you agree that your contributions will be licensed under the same license as this project (MIT License).

---

**Maintainer**: BIRRUL WALIDAIN  
**GitHub**: [@birrulwldain](https://github.com/birrulwldain)  
**Repository**: https://github.com/birrulwldain/Tesis-26msi  
**Last Updated**: November 18, 2025
