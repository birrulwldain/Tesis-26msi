# ⚡ QUICK START - UNIFIED THESIS SYSTEM

## 🎯 One File. Three Modes. Done.

```
thesis.tex (1 file) 
  ├─ Mode 1: SEMPRO  → sempro.pdf  (Bab 1-2)
  ├─ Mode 2: SEMHAS  → semhas.pdf  (Bab 1-3)
  └─ Mode 3: SIDANG  → sidang.pdf  (Bab 1-5 + Lampiran)
```

---

## 🚀 QUICK COMMANDS

### Build All Modes:
```bash
./build-thesis.sh all
```

### Build Specific Mode:
```bash
./build-thesis.sh sempro    # Generate sempro.pdf
./build-thesis.sh semhas    # Generate semhas.pdf
./build-thesis.sh sidang    # Generate sidang.pdf
```

### Watch Mode (Auto-compile):
```bash
./build-thesis.sh watch
```

### Clean Up:
```bash
./build-thesis.sh clean
```

---

## 📝 HOW TO EDIT

### Edit Metadata (Terpusat):
File: `thesis.tex` (line ~110-130)
```latex
\judul{Judul Penelitian Anda}
\penulis{Nama Anda}
\nim{170601056}
\pembimbingi{Nama Pembimbing}
\tanggal{15}{11}{2025}
```
**EDIT 1 KALI = berlaku semua mode** ✅

### Edit Konten per Mode:

| Mode | Edit Files | Skip Files |
|------|-----------|-----------|
| **SEMPRO** | bab1.tex, bab2.tex | bab3-5, lampiran |
| **SEMHAS** | bab1.tex, bab2.tex, bab3.tex | bab4-5, lampiran |
| **SIDANG** | bab1-5.tex, lampiran.tex | (compile semua) |

Location: `include/` folder

---

## 🎮 VS CODE (Optional GUI)

1. Open: `thesis.tex`
2. Select Recipe: **Ctrl+Alt+B**
3. Choose:
   - `xelatex + biber (sidang)` untuk full compile
   - `xelatex (sempro)` untuk quick compile
4. Auto-save: **Cmd+S** → compile dengan recipe terpilih

---

## ✅ VERIFY INSTALLATION

```bash
# Check if xelatex exists
xelatex --version

# Check if biber exists
biber --version

# Test first compile
cd /Users/birrulwldain/Projects/Tesis-26msi
./build-thesis.sh sidang
```

Should output: `sidang.pdf` ✅

---

## 🐛 TROUBLESHOOTING

### XeLaTeX not found
```bash
brew install --cask mactex-no-gui
```

### Biber not found
```bash
tlmgr update --all
```

### JSON errors in VS Code
```bash
python3 -m json.tool .vscode/settings.json
```

---

## 📚 FULL DOCUMENTATION

See: `README-UNIFIED.md` for complete guide

---

**Ready to go!** 🚀
