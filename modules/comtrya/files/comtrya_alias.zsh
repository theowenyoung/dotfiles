# ca

function ca (){
  UNIT="$1";
  # check if exist
  if [ "$UNIT" = "all" ]
    then
      cd -- $HOME/env
      comtrya -d modules apply
      comtrya -d private apply
  fi
  
  if [ -z "$UNIT" ]
  then
      echo yes here
      # apply current
      comtrya apply
  else
    cd -- $HOME/env
    # check if file exist
    public_file=$HOME/env/modules/$UNIT/$UNIT.yml
    private_file=$HOME/env/private/$UNIT/$UNIT.yml
    echo check $private_file if exist
    if [ -f "$private_file" ]
    then
      echo private file exist
      comtrya apply -m "private.$UNIT.$UNIT"
    fi
    echo check $public_file if exist
    if [ -f "$public_file" ] 
    then
      echo public file exist
      module_name="modules.$UNIT.$UNIT";
      comtrya apply -m $module_name
    fi
    
  fi 
}
