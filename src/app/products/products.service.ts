import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError, tap } from 'rxjs/operators';



const endpoint = 'http://localhost:8000/foodpark/';
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json',
    'Authorization': 'testtoken'
  })
};

@Injectable({
  providedIn: 'root'
})
export class ProductsService {
  private extractData(res: Response) {
    let body = res;
    return body || { };
  }

  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
  
      // TODO: send the error to remote logging infrastructure
      console.error(error); // log to console instead
  
      // TODO: better job of transforming error for user consumption
      console.log(`${operation} failed: ${error.message}`);
  
      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }
  constructor(private http: HttpClient) { }

  getProducts(): Observable<any> {
    return this.http.get(endpoint + 'product/get',httpOptions).pipe(
      map(this.extractData));
  }

  getProductsByName(productName): Observable<any> {
    return this.http.get(endpoint + 'product/get/'+productName,httpOptions).pipe(
      map(this.extractData));
  }

  getProductsById(id): Observable<any> {
    return this.http.get(endpoint + 'product/get/'+id,httpOptions).pipe(
      map(this.extractData));
  }
}
