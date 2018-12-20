import { Component, OnInit,ViewChild } from '@angular/core';
import { CategoryService } from '../category/category.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ProductsService } from '../products/products.service';



@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
 
})
export class SearchComponent implements OnInit {
	
//@ViewChild(CategoryComponent) catg: CategoryComponent;
categorys:any = [];
products:any =[];
catvalue:string;
productval:string;
  constructor(public rest:CategoryService,public product:ProductsService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {
    this.getcategorys();
    this.getProducts();    
   
  }
  getcategorys() {
    this.categorys = [];
    this.rest.getCategorys().subscribe((data: {}) => {      
      this.categorys = data;
    });
  }
  getProducts() {
    this.products = [];
    this.product.getProducts().subscribe((data: {}) => {      
      this.products = data;
    });
  }

}
