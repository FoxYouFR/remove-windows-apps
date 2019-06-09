$array = Get-AppxPackage | Select Name, SignatureKind
$number = 0

foreach($element in $array){
    $name = $element.Name
    if($element.SignatureKind -eq "Store"){
        $answer = Read-Host -Prompt "Do you want to remove $name ? (type yes to remove it)"
        if($answer -eq "yes"){
            echo "Trying to remove $name"
            try{ 
                Get-AppxPackage $element.Name | Remove-AppxPackage
                echo "$name has been deleted"
                $number++
            } catch {
                echo "An error occured, $name has not been uninstalled"
            }
        }
    }
}

if($number -gt 1){
    echo "$number applications have been removed"
} elseif ($number -eq 1){
    echo "One application has been removed"
} else {
    echo "No application has been removed"
}

pause
