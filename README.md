# typst-ufpr

A Typst template for academic documents following UFPR (Federal University of Paraná) formatting guidelines.

#### Credits: @chrispdobb (main developer) & @gloriadeitos ~ Curitiba-PR, Brasil ~ 2025
## 🔸Installation Instructions

### Installing Typst

1. **Download Typst**: 
   - Go to [Typst Releases](https://github.com/typst/typst/releases)
   - Download `typst-x86_64-pc-windows-msvc.zip` for Windows

2. **Extract and Setup**:
   - Save the ZIP file to a folder on your computer
   - Extract the contents of the ZIP file
   - Open Command Prompt (cmd) or PowerShell
   - Navigate to the extracted folder containing the Typst executable

3. **Add to PATH (Optional but Recommended)**:
   - Copy the Typst executable to a directory in your system's PATH
   - Or add the Typst folder to your system's PATH environment variable
   - This allows you to run `typst` from any directory

### Using the Template

1. **Install Typst** (if not already installed):
   ```bash
   # Alternatively, you can install via package managers:
   # Windows (Winget):
   winget install typst
   
   # Or using cargo (Rust package manager):
   cargo install typst
   ```

2. **Clone or download this repository**

3. **Compile your document**:
   ```bash
   typst compile main.typ
   ```

4. **Watch for changes (development)**:
   ```bash
   typst watch main.typ
   ```

### Requirements

- Typst installed on your system
- Basic understanding of Typst syntax
- Text editor for modifying `.typ` files

### Features

- UFPR-compliant formatting
- Academic document structure
- Customizable templates for theses, dissertations, and academic papers
- Automatic bibliography handling
- Support for multiple languages

For more information about Typst, visit: https://typst.app/

## 🔸Getting Started with Typst and GitHub

### Setting up a Typst Project Repository

1. **Install Typst**:
   ```bash
   # Windows (using Winget)
   winget install typst
   
   # Or download from GitHub releases:
   # Visit https://github.com/typst/typst/releases
   # Download typst-x86_64-pc-windows-msvc.zip
   # Extract and add to your PATH
   ```

2. **Create a new GitHub repository** for your Typst project

3. **Clone your repository**:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```

4. **Add your Typst files** to the repository:
   - `main.typ` (main document file)
   - `template.typ` (template configuration)
   - `references.bib` (bibliography file, if needed)
   - Any image assets or additional files

5. **Configure .gitignore** (create a `.gitignore` file):
   ```
   # Typst build outputs
   *.pdf
   /output/
   
   # OS files
   .DS_Store
   Thumbs.db
   
   # Editor files
   .vscode/
   .idea/
   ```

6. **Commit and push your files**:
   ```bash
   git add .
   git commit -m "Initial Typst project setup"
   git push origin main
   ```

### GitHub Actions for Automated PDF Building

Create `.github/workflows/build.yml`:

```yaml
name: Build Typst Document

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    
    - name: Setup Typst
      uses: typst/setup-typst@v2
      with:
        version: latest
        
    - name: Build PDF
      run: typst compile main.typ main.pdf
      
    - name: Upload PDF artifact
      uses: actions/upload-artifact@v4
      with:
        name: document
        path: main.pdf
```

### Local Development Workflow

1. **Start watching for changes**:
   ```bash
   typst watch main.typ
   ```
   This automatically recompiles when files change

2. **Compile manually**:
   ```bash
   typst compile main.typ output.pdf
   ```

3. **Add new dependencies** (if using packages):
   ```typst
   #import "@preview/package:0.1.0": *
   ```

### Repository Structure Example

```
your-repo/
├── .github/
│   └── workflows/
│       └── build.yml
├── assets/
│   ├── images/
│   └── fonts/
├── main.typ
├── template.typ
├── references.bib
├── README.md
└── .gitignore
```

### Collaboration Features

- Use GitHub Issues for tracking tasks
- Create Pull Requests for changes
- GitHub Actions automatically builds PDF on push
- Use GitHub Pages to host the compiled document

For more information about Typst, visit: https://typst.app/

## 🔸 How to Use a Ready Typst Project from GitHub

### Cloning and Running an Existing Repository

### 1. **Prerequisites**
```bash
# First install Typst (if you haven't already)
# Windows with Winget:
winget install typst

# Or download manually:
# Visit https://github.com/typst/typst/releases
# Download typst-x86_64-pc-windows-msvc.zip
# Extract and add to system PATH
```

### 2. **Clone the Repository**
```bash
# Open Command Prompt or PowerShell
git clone https://github.com/username/repository-name.git
cd repository-name
```

### 3. **Explore Project Structure**
```bash
# Check project files
dir   # Windows
ls    # Linux/Mac
```

### 4. **Compile the Document**
```bash
# Compile main file
typst compile main.typ

# Or specify input and output files
typst compile document.typ output.pdf

# Development mode (auto-recompiles on changes)
typst watch main.typ
```

## 🐛 Common Troubleshooting

### If dependencies are missing:
```bash
# Check if Typst is installed
typst --version

# If command not found, add to PATH
# Or use full path to executable
C:\path\to\typst.exe compile main.typ
```

### If compilation errors occur:
1. Verify all images/assets are in correct locations
2. Check package versions in the code
3. Review project's `README.md` for specific instructions

## 📁 Typical Typst Project Structure

```
typst-project/
├── main.typ              # Main document file
├── template.typ          # Custom template
├── references.bib        # Bibliography (optional)
├── assets/               # Images and resources
│   ├── images/
│   └── fonts/
├── .gitignore           # Files ignored by Git
└── README.md            # Project instructions
```

## 🔄 Useful Commands

```bash
# Compile to PDF
typst compile input.typ output.pdf

# Compile and open automatically
typst compile --open main.typ

# Get Typst help
typst --help

# Check version
typst --version
```

## 💡 Important Tips

1. **Always check the README.md** for project-specific instructions
2. **Review requirements** (Typst version, additional packages)
3. **Keep Typst updated**: `winget upgrade typst`
4. Use `typst watch` during development for real-time preview

Need help with a specific project? Send me the repository link!
