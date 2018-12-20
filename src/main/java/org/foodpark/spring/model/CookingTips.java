package org.foodpark.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cooking_tips")
public class CookingTips {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "product_id")
	private Integer product;

	@Column(name = "tips")
	private String tips;

	@Column(name = "safe_minimum_temperature")
	private Integer safeMinimumTemperature;

	@Column(name = "rest_time")
	private Integer restTime;

	@Column(name = "rest_time_metric")
	private String restTimeMetric;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProduct() {
		return product;
	}

	public void setProduct(Integer product) {
		this.product = product;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	public Integer getSafeMinimumTemperature() {
		return safeMinimumTemperature;
	}

	public void setSafeMinimumTemperature(Integer safeMinimumTemperature) {
		this.safeMinimumTemperature = safeMinimumTemperature;
	}

	public Integer getRestTime() {
		return restTime;
	}

	public void setRestTime(Integer restTime) {
		this.restTime = restTime;
	}

	public String getRestTimeMetric() {
		return restTimeMetric;
	}

	public void setRestTimeMetric(String restTimeMetric) {
		this.restTimeMetric = restTimeMetric;
	}

}