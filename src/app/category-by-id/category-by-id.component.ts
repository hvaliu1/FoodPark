import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../category/category.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-category-by-id',
  templateUrl: './category-by-id.component.html',
  styleUrls: ['./category-by-id.component.css']
})
export class CategoryByIdComponent implements OnInit {
  categorysByid:any=[];
  routeSub:any;
  constructor(public rest:CategoryService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {
    this.routeSub = this.route.params.subscribe(params => {
      this.getcategoryById(params.id);   
    }); 
    
     
   
  }

  getcategoryById(id) {
    this.categorysByid = [];
    this.rest.getCategorysById(id).subscribe((data: {}) => {
      console.log(data);
      this.categorysByid = data;
    });
  }


}
