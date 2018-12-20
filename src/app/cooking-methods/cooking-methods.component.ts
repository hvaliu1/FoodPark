import { Component, OnInit } from '@angular/core';
import { CookingMethodsService } from './cooking-methods.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-cooking-methods',
  templateUrl: './cooking-methods.component.html',
  styleUrls: ['./cooking-methods.component.css']
})
export class CookingMethodsComponent implements OnInit {

  constructor(public rest:CookingMethodsService, private route: ActivatedRoute, private router: Router) { }

  cookingMethods:any = [];
  ngOnInit() {
    this.getCookingMethods();
  }

  getCookingMethods() {
    this.cookingMethods = [];
    this.rest.getCookingMethods().subscribe((data: {}) => {      
      this.cookingMethods = data;
    });
  }

}
