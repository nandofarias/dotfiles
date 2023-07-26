function npmg --description "Install global npm packages the right way"
  cd $HOME/.npmbin
  npm i $argv --save-dev
  cd -
end
