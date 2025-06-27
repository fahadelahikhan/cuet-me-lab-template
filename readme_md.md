# CUET ME Lab Report Template

A professional LaTeX class for Chittagong University of Engineering & Technology (CUET) Mechanical Engineering lab reports.

## Author Information
- **Author**: Fahad Elahi Khan
- **Student ID**: 2103017
- **Institution**: CUET, Department of Mechanical Engineering
- **Created**: June 2025

## Features
- Custom class file following LaTeX best practices
- Professional cover page design
- Automatic font fallback system
- Easy-to-use interface with custom commands
- Consistent formatting across all reports

## File Structure
```
cuet-me-lab-template/
├── cuet-report.cls          # Main class file
├── main.tex                 # Example usage file
├── fonts/                   # Font files directory
│   ├── Crimson-Roman.ttf
│   ├── PlayfairDisplay-Black.ttf
│   ├── Merriweather-Bold.ttf
│   └── Merriweather-Regular.ttf
├── images/
│   └── CUET_Logo.png        # University logo
├── README.md
└── LICENSE
```

## Installation & Usage

### Method 1: Local Installation
1. Download all files to your project directory
2. Place font files in the `fonts/` directory
3. Ensure CUET logo is in the `images/` directory
4. Compile with XeLaTeX (required for custom fonts)

### Method 2: System-wide Installation
1. Place `cuet-report.cls` in your LaTeX class directory
2. Install fonts system-wide
3. Use the class in any LaTeX document

### Basic Usage
```latex
\documentclass{cuet-report}

% Set your report information
\reportnumber{03}
\reporttitle{Your Report Title}
\studentname{Your Name}
\studentid{Your ID}
\groupname{Your Group}
\coursecode{Course Code}
\coursetitle{Course Title}
\performancedate{DD/MM/YYYY}
\submissiondate{DD/MM/YYYY}

\begin{document}
    \makereporttitle
    
    % Your content here
\end{document}
```

## Font Requirements

### Primary Fonts (Recommended)
- **Crimson-Roman**: Body text
- **Playfair Display Black**: Primary headings
- **Merriweather Bold/Regular**: Secondary headings and subtitles

### Fallback Fonts
The class automatically falls back to system defaults if custom fonts are unavailable:
- Times New Roman (body text fallback)
- Default serif bold (heading fallback)

## Compilation
**Important**: This template requires XeLaTeX for proper font handling.

```bash
xelatex main.tex
```

## Font Installation Guide

### Windows
1. Download font files from Google Fonts
2. Right-click → "Install for all users"
3. Restart your LaTeX editor

### macOS
1. Download font files
2. Double-click to open in Font Book
3. Click "Install Font"

### Linux
1. Copy fonts to `~/.fonts/` or `/usr/share/fonts/`
2. Run `fc-cache -fv`

## License & Usage Rights

This template is released under **Creative Commons Attribution-NonCommercial-ShareAlike 4.0**.

### You are free to:
- Use for academic and educational purposes
- Modify and adapt for your needs
- Share with attribution

### You must:
- Provide attribution to the original author
- Share derivatives under the same license
- Not use for commercial purposes without permission

### Attribution Format
```
Original template by Fahad Elahi Khan (2103017)
CUET Mechanical Engineering Department
```

## Troubleshooting

### Common Issues
1. **Font not found warnings**: Install required fonts or use fallback mode
2. **Logo missing**: Ensure `CUET_Logo.png` is in the images directory
3. **Compilation errors**: Use XeLaTeX instead of PDFLaTeX

### Getting Help
- Check the examples directory for sample usage
- Ensure all dependencies are installed
- Use XeLaTeX for compilation

## Contributing
If you find bugs or have suggestions for improvements, please:
1. Check existing issues first
2. Provide detailed description of the problem
3. Include your LaTeX version and operating system

## Changelog
- **v1.0** (June 2025): Initial release with full functionality

---

**Note**: This template is specifically designed for CUET ME students. While others may use it with proper attribution, please respect the academic integrity guidelines of your institution.