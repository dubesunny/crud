function clearErrors(){
    const errors = document.getElementsByClassName('field-error');
    for(let item of errors){
        item.innerHTML = "";
    }
}

function setError(id, error){
    let element = document.getElementById(id);
    let errorElement = element.nextElementSibling; 
    if (errorElement && errorElement.classList.contains('field-error')) {
        errorElement.innerHTML = error;
    }
}

function validation(){
    let isvalid = true;
    clearErrors(); 
    const name = document.forms['myform']['name'].value.trim();
    if(name.length==0){
        setError("name", "Please enter a name");
        isvalid = false;
    }else if(name.length<5){
        setError("name", "Length of name is too short (minimum 5 characters)");
        isvalid = false;
    }

    const photo = document.forms['myform']['photo'].value.trim();
    if(photo.length==0){
        setError("photo","Please upload a photo");
        isvalid = false;
    }
    const email = document.forms['myform']['email'].value.trim();
    if(email.length==0){
        setError("email","Please enter an email");
        isvalid = false;
    }else if(email.length>15){
        setError("email","Email length is too long");
        isvalid = false;
    }

    const phone = document.forms['myform']['phone'].value.trim();
    if(phone.length != 10){
        setError("phone","Phone number should be of 10 digits");
        isvalid = false;
    }

    const hobbies = document.forms['myform']['hobby[]'];
    let hobbySelected = false;
    for (let i = 0; i < hobbies.length; i++) {
        if(hobbies[i].checked){
            hobbySelected = true;
            break;
        } 
    }

    if(!hobbySelected){
        alert("Please select at least one hobby");
        isvalid = false;
    }

    const gender = document.querySelectorAll('input[name="Gender"]');
    let genderSelected = false;
    for (let g of gender) {
       if(g.checked){
        genderSelected = true;
        break;
       } 
    }

    if(!genderSelected){
        alert("Please select a gender");
        isvalid = false;
    }

    const address = document.forms['myform']['address'].value.trim();
    if(address == ""){
        setError("address","Please enter your address");
        isvalid = false;

    }
    return isvalid; 

}
