# ca

function ca (){
  UNIT="$1";
  # check if exist
  if [ "$UNIT" = "all" ]
    then
      cd -- $DOTFILES_ROOT_PATH
      comtrya -d modules apply
      cd -- $DOTFILES_PRIVATE_PATH
      comtrya -d private apply
  fi
  
  if [ -z "$UNIT" ]
  then
      # apply current
      comtrya apply
  else
  
    # check if file exist
    public_file=$DOTFILES_ROOT_PATH/modules/$UNIT/$UNIT.yml
    private_file=$DOTFILES_PRIVATE_PATH/$UNIT/$UNIT.yml
    echo check $private_file if exist
    if [ -f "$private_file" ]
    then
      echo private file exist
      cd -- $DOTFILES_PRIVATE_PATH
      comtrya apply -m "private.$UNIT.$UNIT"
    fi
    echo check $public_file if exist
    if [ -f "$public_file" ] 
    then
      echo public file exist
      cd -- $DOTFILES_ROOT_PATH
      module_name="modules.$UNIT.$UNIT";
      comtrya apply -m $module_name
    fi
    
  fi 
}
