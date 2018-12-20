package org.foodpark.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cooking_methods")
public class CookingMethods {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "product_id")
	private Integer product;

	@Column(name = "cooking_method")
	private String cookingMethod;

	@Column(name = "measure_from")
	private Double measureFrom;

	@Column(name = "measure_to")
	private Double measureTo;

	@Column(name = "size_metric")
	private String sizeMetric;

	@Column(name = "cooking_temperature")
	private String cookingTemperature;

	@Column(name = "timing_from")
	private Double timingFrom;

	@Column(name = "timing_to")
	private Double timingTo;

	@Column(name = "timing_metric")
	private String timingMetric;

	@Column(name = "timing_per")
	private String timingPer;

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

	public String getCookingMethod() {
		return cookingMethod;
	}

	public void setCookingMethod(String cookingMethod) {
		this.cookingMethod = cookingMethod;
	}

	public Double getMeasureFrom() {
		return measureFrom;
	}

	public void setMeasureFrom(Double measureFrom) {
		this.measureFrom = measureFrom;
	}

	public Double getMeasureTo() {
		return measureTo;
	}

	public void setMeasureTo(Double measureTo) {
		this.measureTo = measureTo;
	}

	public String getSizeMetric() {
		return sizeMetric;
	}

	public void setSizeMetric(String sizeMetric) {
		this.sizeMetric = sizeMetric;
	}

	public String getCookingTemperature() {
		return cookingTemperature;
	}

	public void setCookingTemperature(String cookingTemperature) {
		this.cookingTemperature = cookingTemperature;
	}

	public Double getTimingFrom() {
		return timingFrom;
	}

	public void setTimingFrom(Double timingFrom) {
		this.timingFrom = timingFrom;
	}

	public Double getTimingTo() {
		return timingTo;
	}

	public void setTimingTo(Double timingTo) {
		this.timingTo = timingTo;
	}

	public String getTimingMetric() {
		return timingMetric;
	}

	public void setTimingMetric(String timingMetric) {
		this.timingMetric = timingMetric;
	}

	public String getTimingPer() {
		return timingPer;
	}

	public void setTimingPer(String timingPer) {
		this.timingPer = timingPer;
	}

}