import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../category/category.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-category-by-name',
  templateUrl: './category-by-name.component.html',
  styleUrls: ['./category-by-name.component.css']
})
export class CategoryByNameComponent implements OnInit {

  categorysByname:any=[];
  routeSub:any;
  constructor(public rest:CategoryService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {
    this.routeSub = this.route.params.subscribe(params => {
      this.getcategoryByName(params.catname);   
    }); 
    
     
   
  }

  getcategoryByName(name) {
    this.categorysByname = [];
    this.rest.getCategorysByName(name).subscribe((data: {}) => {
      console.log(data);
      this.categorysByname = data;
    });
  }

}
