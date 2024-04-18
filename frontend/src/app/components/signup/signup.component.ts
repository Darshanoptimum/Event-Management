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

  mail?: String;
  showFirst: boolean = true;
  myForm!: FormGroup;
  myForm1!: any;
  ResponseLogin?: string;
  ResponseRegister?: string;
  users?: User[];
  user = new User();
  data: any;

  constructor(private fb: FormBuilder, private adminGuard: AdminGuard, private userGuard: UserGuard, private apiService: ApiService, private elementRef: ElementRef, private router: Router) { }

  // change the signin and signup page
  toggleSections() {
    this.showFirst = !this.showFirst;
  }

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

  onSubmit1(form: FormGroup) {
    this.user.Name = form.value.LoginName;
    this.user.Email = form.value.LoginEmail;
    this.user.Password = form.value.LoginPassword;
    if (form.valid) {
      if (form.value.LoginType == "Admin") {
        // call api for Admin validation
        this.apiService.addPerson(this.user, "api/AdminLogin")
          .subscribe(
            data => {
              console.log(data);
              this.ResponseLogin = data;
              if (data == "Valid Admin") {
                this.router.navigate(["/admindashboard"])
                this.adminGuard.Adminlogin = true;
              }
            },
            error => {
              alert("Error")
              console.log(error);
            });
      }
      if (form.value.LoginType == "User") {
        // call api for user validation
        this.apiService.addPerson(this.user, "api/UserLogin")
          .subscribe(
            data => {
              console.log(data);
              this.ResponseLogin = data;
              if (data == "Valid User") {
                this.router.navigate(["/userdashboard"])
                this.userGuard.Userlogin = true;
              }
            },
            error => {
              alert("Error")
              console.log(error);
            });
      }
    } else {
      alert("Enter valid value")
    }
  }

  onSubmit2(form: FormGroup) {
    this.user.Name = form.value.name;
    this.user.Email = form.value.email;
    this.user.Password = form.value.password;
    this.user.MobileNumber = form.value.mobile;
    if (form.valid) {
      // call api for user registration
      this.apiService.addPerson(this.user, "api/RegisterUser")
        .subscribe(
          data => {
            console.log(data);
            this.ResponseRegister = data;
          },
          error => {
            console.log(error);
            alert("Error")
          });
    }
    else {
      alert("Enter valid value")
    }
  }
}
