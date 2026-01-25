function dux --wraps='du -hs $(ls -A) | sort -h' --wraps='du -hs $(ls -A) | sort -hr' --wraps='du -hs (ls -A) | sort -hr' --description 'alias dux du -hs (ls -A) | sort -hr'
  du -hs (ls -A) | sort -hr $argv

end
