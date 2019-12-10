function GetAllSelectedCheckbox()
{
    var checkboxesMain1 = document.getElementsByName("mainDisk1");
    var checkboxesMain2 = document.getElementsByName("mainDisk2");
    var checkboxesSide = document.getElementsByName("sideDisk");
    var checkboxesCombo = document.getElementsByName("combo");


    var sendParam = document.getElementById("SendParamFood");
    var sendParamCombo = document.getElementById("SendParamCombo");

    
    
  var checkboxesChecked = [];
    var checkboxesCheckedCombo = [];

  
  // loop over them all
  for (var i=0; i<checkboxesMain1.length; i++) {
     // And stick the checked ones onto an array...
     if (checkboxesMain1[i].checked) {
        checkboxesChecked.push(checkboxes[i].value);
     }
  }
  
  checkboxesChecked.push("/");
  
  for (var i=0; i<checkboxesMain2.length; i++) {
     // And stick the checked ones onto an array...
     if (checkboxesMain2[i].checked) {
        checkboxesChecked.push(checkboxes[i].value);
     }
  }
  
    checkboxesChecked.push("/");
    
    for (var i=0; i<checkboxesSide.length; i++) {
     // And stick the checked ones onto an array...
     if (checkboxesSide[i].checked) {
        checkboxesChecked.push(checkboxes[i].value);
     }
  }
  
  for (var i=0; i<checkboxesCombo.length; i++) {
     // And stick the checked ones onto an array...
     if (checkboxesCombo[i].checked) {
        checkboxesCheckedCombo.push(checkboxes[i].value);
     }
  }

  sendParam.value = checkboxesChecked;
  sendParamCombo.value = checkboxesCheckedCombo;
//  document.getElementById("Form0").submit();
}


function SelectAllCheckBox(sourceCheckBox)
{
    var checkboxes = document.getElementsByName('selectedUserCheckbox');
    for(var i=0, n=checkboxes.length; i<n; i++)
    {
        checkboxes[i].checked = sourceCheckBox.checked;
    }
}
