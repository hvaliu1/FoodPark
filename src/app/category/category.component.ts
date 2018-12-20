import { Component, OnInit } from '@angular/core';
import { CategoryService } from './category.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css'],
 
})
export class CategoryComponent implements OnInit {
  categorys:any = [];
  categorysByid:any={};
  routeSub:any;
  constructor(public rest:CategoryService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {
    this.getcategorys();
    
   
  }

  getcategorys() {
    this.categorys = [];
    this.rest.getCategorys().subscribe((data: {}) => {      
      this.categorys = data;
    });
  }

  



}
