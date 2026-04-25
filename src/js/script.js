let menuOn = true;

function menuOnOff(){

    if(menuOn){

        menuOn = false;    
        console.log(menuOn);

        document.getElementById('button_on_off').style.rotate = '90deg';

        document.getElementsByClassName('nav-text')[0].style.display = 'none';
        document.getElementsByClassName('nav-text')[1].style.display = 'none';
        document.getElementsByClassName('nav-text')[2].style.display = 'none';


    } else{

        menuOn = true;
        console.log(menuOn);

        document.getElementById('button_on_off').style.rotate = '0deg';

        document.getElementsByClassName('nav-text')[0].style.display = 'inline-block';
        document.getElementsByClassName('nav-text')[1].style.display = 'inline-block';
        document.getElementsByClassName('nav-text')[2].style.display = 'inline-block';

    }

}