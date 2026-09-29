# music-dl completions
complete -c music-dl -l flac -d 'Download as FLAC (default)'
complete -c music-dl -l mp3 -d 'Download as MP3 320kbps'
complete -c music-dl -l m4a -d 'Download as M4A (AAC)'
complete -c music-dl -l wav -d 'Download as WAV'
complete -c music-dl -l dir -r -F -d 'Output directory'
complete -c music-dl -l album -r -d 'Search and download album'
complete -c music-dl -l playlist -r -d 'Download YouTube playlist URL'
complete -c music-dl -s h -l help -d 'Show help'
