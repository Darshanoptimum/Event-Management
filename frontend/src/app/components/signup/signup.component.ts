import { Component, ElementRef, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { User } from '../user';
import { ApiService } from '../api.service';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { AdminGuard } from 'src/app/Guard/admin.guard';
import { UserGuard } from 'src/app/Guard/user.guard';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {

  mail?:String;


  showFirst:boolean=true;
  
  
  toggleSections(){
    this.showFirst=!this.showFirst;
  }

  myForm!: FormGroup;
  myForm1!: any;
  constructor(private fb: FormBuilder,private adminGuard:AdminGuard,private userGuard:UserGuard,private apiService: ApiService,private elementRef:ElementRef,private router:Router) { }
  
  ngOnInit() {
    this.myForm = this.fb.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(8)]],
      mobile: ['', Validators.required],
      address: ['', Validators.required],
    });
    this.myForm1 = this.fb.group({
      LoginType: ['', Validators.required],
      LoginName: ['', Validators.required],
      LoginEmail: ['', [Validators.required, Validators.email]],
      LoginPassword: ['', [Validators.required, Validators.minLength(8)]],
    });
  }
  ResponseLogin?:string;
  ResponseRegister?:string;
  onSubmit1(form: FormGroup) {
    console.log('Valid?', form.valid); // true or false
    console.log('LoginName', form.value.LoginName);
    console.log('LoginEmail', form.value.LoginEmail);
    console.log('LoginPassword', form.value.LoginPassword);
    console.log('LoginType', form.value.LoginType);
    this.user.Name=form.value.LoginName;
    this.user.Email=form.value.LoginEmail;
    this.user.Password=form.value.LoginPassword;
    if(form.valid){
    if(form.value.LoginType=="Admin"){
      this.apiService.addPerson(this.user,"api/AdminLogin")
    .subscribe(
      data => {
        console.log(data);
        this.ResponseLogin=data;
        // var d1 = this.elementRef.nativeElement.querySelector('#Message');
        // d1.innerHTML="";
        // d1.insertAdjacentHTML('beforeend', '<div class="two"><b>'+data+'</b></div>');
        if(data=="Valid Admin"){
        this.router.navigate(["/admindashboard"])
          this.adminGuard.Adminlogin=true;
        }
      }, 
      error => {
        console.log(error);
      });
    }
    if(form.value.LoginType=="User"){
      this.apiService.addPerson(this.user,"api/UserLogin")
    .subscribe(
      data => {
        console.log(data);
        this.ResponseLogin=data;
        // var d1 = this.elementRef.nativeElement.querySelector('#Message');
        // d1.innerHTML="";
        // d1.insertAdjacentHTML('beforeend', '<div class="two"><b>'+data+'</b></div>');
        if(data=="Valid User"){
          this.router.navigate(["/userdashboard"])
          this.userGuard.Userlogin=true;
        }
      }, 
      error => {
        console.log(error);
      });
    }
    }else{
      alert("Enter valid value")
    }
  }
  users?:User[];
  user = new User();
  data: any;
  onSubmit2(form: FormGroup) {
    console.log('Valid?', form.valid); // true or false
    console.log('name', form.value.name);
    console.log('email', form.value.email);
    console.log('password', form.value.password);
    console.log('mobile', form.value.mobile);

    this.user.Name=form.value.name;
    this.user.Email=form.value.email;
    this.user.Password=form.value.password;
    this.user.MobileNumber=form.value.mobile;
    if(form.valid){
    this.apiService.addPerson(this.user,"api/RegisterUser")
    .subscribe(
      data => {
        console.log(data);
        this.ResponseRegister=data;
        // var d1 = this.elementRef.nativeElement.querySelector('#errorMessage');
        // d1.innerHTML="";
        // d1.insertAdjacentHTML('beforeend', '<div class="two"><b>'+data+'</b></div>');
        
      }, 
      error => {
        console.log(error);
      }); 
    }
    else{
      alert("Enter valid value")
    }
  }
  
}
