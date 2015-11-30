/*
 -Changes: capitalize the first letter of the stuff on the right. 
 -Can potentially make previous and current highlighted (main has big highlight, secondary has slightly differen)
 -Add in a function to clear all span colors when clicking one of the radios
 -Edit the XSLT to a) create the three panels b) give basic stuff that we're missing in example javascript
  
  
 */



window.onload = function(){
    setBoxes();
        //Set up the #rightPanel scrolling thing to eliminate that issue
    //onmouseover="document.body.style.overflow='hidden';" onmouseout="document.body.style.overflow='auto';"
    var rightPanel = document.querySelectorAll('#rightPanel');
    rightPanel[0].setAttribute('onmouseover', 'document.body.style.overflow="hidden"');
    rightPanel[0].setAttribute('onmouseout', 'document.body.style.overflow="auto"');
}

function setBoxes(){
    var container = document.getElementById('boxes')
    var spans = document.querySelectorAll('span'); 
    var classes = []
    
    for (var i = 0; i < spans.length; i++){
        var thisClass = spans[i].getAttribute('class')
        if (classes.indexOf(thisClass) == -1){
           classes.push(thisClass)
           }
    }
    
    for (var i = 0; i < classes.length; i++){
        var newLabel = document.createElement("label");
        var newText = document.createTextNode(classes[i])
        newLabel.appendChild(newText);
        newLabel.setAttribute('for', classes[i])
        var newBox = document.createElement("input");
        newBox.type = "radio";
        newBox.id = classes[i]
        newBox.name = 'selector'
        newBox.setAttribute('onclick', 'highlight("'.concat(classes[i], '")'));
        container.appendChild(newLabel)
        container.appendChild(newBox)
    }
}

function highlight(highlightClass) {
    clearRight()
    var spans = document.getElementsByClassName(highlightClass);
    var rightPanel = document.getElementById('rightPanel');
    for (var i = 0; i < spans.length; i++){
        spans[i].setAttribute('style', 'color:red');
        spans[i].id = 'target'.concat(i);
        var newP = document.createElement('p');
        var newA = document.createElement('a');
        var pText = document.createTextNode(spans[i].innerText);
        newA.appendChild(pText);
        newA.href = '#target'.concat(i);
        newP.appendChild(newA);
        newP.appendChild(newA)
        rightPanel.appendChild(newP);
    }
}

function clearRight(){
     var rightDiv = document.getElementById('rightPanel');
     while (rightDiv.hasChildNodes()){
        rightDiv.removeChild(rightDiv.childNodes[0]);
     }
    
     var spans = document.querySelectorAll('span'); 
     for (var i = 0; i < spans.length; i++){
         spans[i].removeAttribute('id')
     }
}