function CheckForm() 
            { 
                var User= document.getElementById('inUser').value; 
                var Pass= document.getElementById('inPass').value; 
                var errormsg= 'Must fill:  n' 
                if(User == '') 
                    { 
                    var error= true;
                    var errormsg= errormsg + 'User'; 
                    } 
                if(Pass == '') 
                    { 
                    var error= true; 
                    var errormsg= errormsg + 'Password'; 
                    } 
                if(error) 
                { 
                    alert(errormsg) 
                } 
                else //sino 
                { 
                    document.getElementById('loginForm').submit();
                } 
            }


