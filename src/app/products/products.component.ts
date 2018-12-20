import { Component, OnInit } from '@angular/core';
import { ProductsService } from './products.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  products:any =[];
  constructor(public product:ProductsService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {
    this.getProducts();
  }
  


getProducts() {
  this.products = [];
  this.product.getProducts().subscribe((data: {}) => {      
    this.products = data;
  });
}


}
