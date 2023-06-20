function wchat --wraps='OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES weechat' --description 'alias wchat=OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES weechat'
  OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES weechat $argv
        
end
