# Epoka University LaTeX Template - Metadata Variables Reference

## All Available Metadata Variables

All thesis information is defined in `metadata.tex`. Here's a complete list of available variables:

### Thesis Type
```latex
\BSc   % For Bachelor of Science
\MSc   % For Master of Science
\PhD   % For Doctor of Philosophy
```

### Student Information
```latex
\author{FirstName}{LastName}
```

### Thesis Titles
```latex
\title{ENGLISH TITLE}                    % Used on cover page
\titleenglish{ENGLISH TITLE}             % Used in English abstract
\titlealbanian{ALBANIAN TITLE}           % Used in Albanian abstract (optional)
```

### Dates
```latex
\date{June 2026}                         % Used on cover page and Albanian abstract
\dateenglish{June 2026}                  % Used in English abstract
```

### Supervisor
```latex
\supervisor{Prof. Dr. Name}              % Used on cover page and Albanian abstract
\supervisorenglish{Prof. Dr. Name}       % Used in English abstract
```

### Department and Faculty
```latex
\department{Computer Engineering}        % Used on cover page
\departmentenglish{Computer Engineering} % Used in approval page and abstract
\faculty{Faculty of Architecture and Engineering}
\facultyenglish{Faculty of Architecture and Engineering}
```

### Head of Department
```latex
\headofdepartment{Prof. Dr. Name}        % For approval page
```

### Committee Members
```latex
\committee
    {Prof. Dr. Supervisor Name}          % Chair/Supervisor
    {Assoc. Prof. Dr. Member Two}        % Member 2
    {Asst. Prof. Dr. Member Three}       % Member 3
    {}                                   % Member 4 (optional)
    {}                                   % Member 5 (optional)
```

### Abstracts
```latex
\abstract{
    Your English abstract text here...
}

\abstrakt{
    Albanian abstract text here...
    (Will appear as "ABSTRAKT" in the thesis)
}
```

### Keywords
```latex
\keywordsenglish{Keyword 1, Keyword 2, Keyword 3}
\keywords{Fjalë kyçe 1, Fjalë kyçe 2, Fjalë kyçe 3}
```

### Acknowledgments
```latex
\acknowledgments{
    Your acknowledgments text here...
}
```

### Abbreviations (Optional)
```latex
\abbreviations{
    \begin{tabular}{ll}
        AI & Artificial Intelligence \\
        ML & Machine Learning \\
    \end{tabular}
}
```

### Optional Settings
```latex
\NoTableList   % Disable list of tables
\NoFigureList  % Disable list of figures
```

## Where Each Variable is Used

| Variable | Cover Page | Approval | Declaration | Abstract EN | Abstract AL |
|----------|-----------|----------|-------------|-------------|-------------|
| `\title` | ✓ | | | | |
| `\titleenglish` | | ✓ | | ✓ | |
| `\titlealbanian` | | | | | ✓ |
| `\author` | | | ✓ | ✓ | ✓ |
| `\date` | ✓ | | | | ✓ |
| `\dateenglish` | | | | ✓ | |
| `\supervisor` | | | | | ✓ |
| `\supervisorenglish` | | | | ✓ | |
| `\department` | ✓ | | | | |
| `\departmentenglish` | | ✓ | | | |
| `\faculty` | ✓ | | | | |
| `\headofdepartment` | | ✓ | | | |
| `\committee` | | ✓ | | | |

## Example metadata.tex

```latex
% Thesis type
\BSc % or \MSc, \PhD

% Student
\author{John}{Doe}

% Titles
\title{MACHINE LEARNING FOR IMAGE PROCESSING}
\titleenglish{MACHINE LEARNING FOR IMAGE PROCESSING}
\titlealbanian{MËSIMI I MAKINERISË PËR PËRPUNIMIN E IMAZHEVE}

% Dates
\date{June 2026}
\dateenglish{June 2026}

% Supervisor
\supervisor{Prof. Dr. Jane Smith}
\supervisorenglish{Prof. Dr. Jane Smith}

% Department
\department{Computer Engineering}
\departmentenglish{Computer Engineering}
\faculty{Faculty of Architecture and Engineering}
\facultyenglish{Faculty of Architecture and Engineering}

% Head of Department
\headofdepartment{Prof. Dr. Department Head}

% Committee
\committee
    {Prof. Dr. Jane Smith}
    {Assoc. Prof. Dr. John Brown}
    {Asst. Prof. Dr. Alice Green}
    {}
    {}

% Abstracts
\abstract{This thesis presents...}
\abstrakt{Kjo tezë prezanton...}

% Keywords
\keywordsenglish{Machine Learning, Image Processing, Deep Learning}
\keywords{Mësimi i Makinerisë, Përpunimi i Imazheve, Mësimi i Thellë}

% Acknowledgments
\acknowledgments{I would like to thank...}
```

## Notes

- All variables are defined in `metadata.tex` - you never need to edit the class file
- Variables with "english" suffix are used in English sections
- Albanian abstract uses the `\ozet{}` command but appears as "ABSTRAKT" in the thesis
- Committee members 4 and 5 are optional (leave as `{}` if not needed)
- All titles should be in UPPERCASE
