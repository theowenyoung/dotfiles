# ca

ca (){
  UNIT=$1;
  cd ~/env;
  # check if exist
  if [ $UNIT -eq "all" ]
    then
      comtrya -d modules apply
      comtrya -d private apply
  fi
  
  if [ -z "$UNIT" ]
  then
      # apply current
      comtrya apply
  else
    # check if file exist
    public_file=$HOME/env/modules/$UNIT/$UNIT.yml
    private_file=$HOME/env/private/$UNIT/$UNIT.yml
    if [ -f "$public_file"] 
    then
      comtrya apply -m modules/$UNIT/$UNIT
    fi
    
    if [ -f "$private_file" ]
    then
      comtrya apply -m private/$UNIT/$UNIT
    fi
    
  fi 
}
