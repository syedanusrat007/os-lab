tput clear
count=0
while [ $count -eq 0 ]
do
    
    echo "1. Addition"
    echo "2. Substraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. power"
    echo "6. square root"
    echo "7. sine"
    echo "8. cos"
    echo "9. exit"
    echo -e "Enter Yr choice : \c"
    read choice

    if [ $choice -ne 9 ]
    then
        echo -e "Enter first number : \c"
        read a
        echo -e "Enter second number : \c"
        read b
    fi
    case $choice in
    1)    ans=`echo $a + $b | bc`
        echo "Addition is $ans"
        ;;
    2)    ans=`echo $a - $b | bc`
        echo "Sub is $ans"
        ;;
    3)    ans=`echo $a \* $b | bc`
        echo "Multi is $ans"
        ;;
    4)    echo scale=2 | bc
        ans=`echo $a / $b | bc`
        echo "Divi is $ans"
        ;;
    5) ans=`echo $a ^ $b | bc -l`
        echo "power is $ans"
        ;;
    6) echo scale=2 | bc 
       ans= `echo "sqrt($a)" |bc -l`
       echo "sqrt is $ans"
        ;;
    7) echo scale=2 | bc 
       ans= `echo "s($a)" |bc -l`
       echo "sine is $ans"
       ;;
    8) echo scale=2 | bc 
       ans= `echo "c($a)" |bc -l`
       echo "cos is $ans"
	;;
    9)    exit 1
        ;;
    *)    echo "Invalid Choice !!!"
        ;;
    esac
    
done
