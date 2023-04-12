function yt-dl-audio --wraps='yt-dlp --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3' --wraps='yt-dlp --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format m4a' --description 'alias yt-dl-audio=yt-dlp --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format m4a'
  yt-dlp --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format m4a $argv
        
end
