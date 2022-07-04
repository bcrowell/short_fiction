\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{story}
\LoadClass[12pt]{article}

\RequirePackage{setspace,ulem}
% Was using fucksetspace instead of setspace because for some reason
% setspace doesn't load properly on BSD. Updating ubuntu make fucksetspace go away.
% Can't remember what was in fucksetspace.
% Setspace is for double spacing.
% Ulem makes \emph{} be interpreted as underlining, and
% does underlining with line breaks.

\RequirePackage{amsmath}
\RequirePackage{amssymb}
%\RequirePackage{courier} % somewhat thin compared to cmtt, but bigger
%\RequirePackage{luximono} % don't know what to install
%\RequirePackage{bera} % sans serif
%apt-get install texlive-fonts-extra

\raggedright
\setlength{\parindent}{13mm}

\setlength{\marginparwidth}{0mm}
\setlength{\textwidth}{6in}
\setlength{\textheight}{8.7in}
\setlength{\hoffset}{-.25in}
\setlength{\voffset}{-.1in}
\setlength{\topmargin}{0in}
\setlength{\oddsidemargin}{.25in}
\setlength{\evensidemargin}{0mm}

\pagestyle{myheadings}

\thispagestyle{empty}
