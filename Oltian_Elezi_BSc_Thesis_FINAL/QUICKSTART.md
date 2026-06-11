# Quick Start Guide - Epoka University LaTeX Thesis Template

## Step-by-Step Instructions for Beginners

### Step 1: Install LaTeX

Choose one option:

**Option A: Use Overleaf (Easiest - No Installation Required)**
1. Go to [https://www.overleaf.com](https://www.overleaf.com)
2. Create a free account
3. Upload all template files to a new project
4. Set `thesis.tex` as the main document
5. Click "Recompile" to generate your PDF

**Option B: Install on Your Computer**
- **Windows**: Download and install [MiKTeX](https://miktex.org/download)
- **Mac**: Download and install [MacTeX](https://www.tug.org/mactex/mactex-download.html)
- **Linux**: Run `sudo apt-get install texlive-full` (Ubuntu/Debian)

### Step 2: Edit Your Information

Open `metadata.tex` and replace the placeholder information:

```latex
% Change this:
\author{John}{Doe}

% To your actual information:
\author{YourFirstName}{YourLastName}
```

Fill in ALL the required fields:
-  Student name
-  Thesis title (English and optionally Albanian/Turkish)
-  Date (e.g., "June 2026")
-  Supervisor name
-  Department and Faculty
-  Committee members
-  Abstract (150-300 words)
-  Keywords (5-7 keywords)
-  Acknowledgments

### Step 3: Write Your Chapters

Edit the chapter files in the `chapters/` folder:

1. **chapter1.tex** - Introduction
   - Background and motivation
   - Problem statement
   - Research objectives
   - Contributions
   - Thesis organization

2. **chapter2.tex** - Literature Review
   - Theoretical background
   - Related work
   - Research gap

3. **chapter3.tex** - Methodology
   - Research design
   - Proposed approach
   - Tools and technologies

4. **chapter4.tex** - Implementation
   - System architecture
   - Implementation details
   - Development environment

5. **chapter5.tex** - Results and Discussion
   - Experimental setup
   - Results
   - Discussion

6. **chapter6.tex** - Conclusion and Future Work
   - Summary of contributions
   - Limitations
   - Future work

### Step 4: Add References

1. Open `references.bib`
2. Add your references in BibTeX format
3. Cite them in your text using `\cite{key}`

**Example:**
```bibtex
@article{smith2020,
    author = {Smith, John},
    title = {Example Article},
    journal = {Journal Name},
    year = {2020}
}
```

In your text: `According to Smith \cite{smith2020}, ...`

### Step 5: Add Figures

1. Save your figures in the `figures/` folder
2. Use PDF, PNG, or JPG format
3. Include them in your chapters:

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{figures/your_figure.pdf}
    \caption{Your figure caption}
    \label{fig:your_label}
\end{figure}
```

Reference the figure: `As shown in Figure \ref{fig:your_label}, ...`

### Step 6: Compile Your Thesis

**Using Overleaf:**
- Just click the "Recompile" button

**Using Command Line:**
```bash
pdflatex thesis.tex
bibtex thesis
pdflatex thesis.tex
pdflatex thesis.tex
```

**Using TeXstudio/TeXmaker:**
1. Open `thesis.tex`
2. Press F5 (or click the green arrow)
3. Wait for compilation to finish
4. View the PDF

### Step 7: Review and Refine

1. Check the generated PDF
2. Verify all information is correct
3. Check formatting of tables, figures, and equations
4. Proofread your content
5. Ask your supervisor to review

## Common Tasks

### Adding a Table

```latex
\begin{table}[htbp]
    \centering
    \caption{Your table caption}
    \label{tab:your_label}
    \begin{tabular}{lcc}
        \toprule
        Column 1 & Column 2 & Column 3 \\
        \midrule
        Data 1 & Data 2 & Data 3 \\
        Data 4 & Data 5 & Data 6 \\
        \bottomrule
    \end{tabular}
\end{table}
```

### Adding an Equation

```latex
\begin{equation}
    E = mc^2
    \label{eq:einstein}
\end{equation}
```

Reference it: `As shown in Equation \ref{eq:einstein}, ...`

### Adding a List

**Bulleted list:**
```latex
\begin{itemize}
    \item First item
    \item Second item
    \item Third item
\end{itemize}
```

**Numbered list:**
```latex
\begin{enumerate}
    \item First item
    \item Second item
    \item Third item
\end{enumerate}
```

### Cross-Referencing

1. Add a label: `\label{ch:introduction}`
2. Reference it: `As discussed in Chapter \ref{ch:introduction}, ...`

Works for chapters, sections, figures, tables, and equations!

## Troubleshooting

**Problem: Compilation errors**
- Read the error message carefully
- Check for missing `}` or `\end{...}`
- Make sure all packages are installed

**Problem: Bibliography not showing**
- Run: pdflatex → bibtex → pdflatex → pdflatex
- Make sure you cited at least one reference

**Problem: Figure not showing**
- Check the file path is correct
- Make sure the figure file exists
- Try using a different image format

**Problem: References showing as [?]**
- Compile multiple times (2-3 times)
- This is normal on first compilation

