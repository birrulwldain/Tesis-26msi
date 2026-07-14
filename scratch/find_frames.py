with open('presentasi-proposal-ae.tex', 'r') as f:
    for idx, line in enumerate(f):
        if '\\begin{frame}' in line:
            print(f'Line {idx+1}: {line.strip()}')
