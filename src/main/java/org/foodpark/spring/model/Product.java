package org.foodpark.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "category_id")
	private Integer categoryId;

	@Column(name = "name")
	private String name;

	@Column(name = "name_subtitle")
	private String nameSubtitle;

	@Column(name = "keywords")
	private String keywords;

	@Column(name = "pantry_min")
	private Integer pantryMin;

	@Column(name = "pantry_max")
	private Integer pantryMax;

	@Column(name = "pantry_metric")
	private String pantryMetric;

	@Column(name = "pantry_tips")
	private String pantryTips;

	@Column(name = "dop_pantry_min")
	private Integer dopPantryMin;

	@Column(name = "dop_pantry_max")
	private Integer dopPantryMax;

	@Column(name = "dop_pantry_metric")
	private String dopPantryMetric;

	@Column(name = "dop_pantry_tips")
	private String dopPantryTips;

	@Column(name = "pantry_after_opening_min")
	private Integer pantryAfterOpeningMin;

	@Column(name = "pantry_after_opening_max")
	private Integer pantryAfterOpeningMax;

	@Column(name = "pantry_after_opening_metric")
	private String pantryAfterOpeningMetric;

	@Column(name = "refrigerate_min")
	private Integer refrigerateMin;

	@Column(name = "refrigerate_max")
	private Integer refrigerateMax;

	@Column(name = "refrigerate_metric")
	private String refrigerateMetric;

	@Column(name = "refrigerate_tips")
	private String refrigerateTips;

	@Column(name = "dop_refrigerate_min")
	private Integer dopRefrigerateMin;

	@Column(name = "dop_refrigerate_max")
	private Integer dopRefrigerateMax;

	@Column(name = "dop_refrigerate_metric")
	private String dopRefrigerateMetric;

	@Column(name = "dop_refrigerate_tips")
	private String dopRefrigerateTips;

	@Column(name = "refrigerate_after_opening_min")
	private Integer refrigerateAfterOpeningMin;

	@Column(name = "refrigerate_after_opening_max")
	private Integer refrigerateAfterOpeningMax;

	@Column(name = "refrigerate_after_opening_metric")
	private String refrigerateAfterOpeningMetric;

	@Column(name = "refrigerate_after_thawing_min")
	private String refrigerateAfterThawingMin;

	@Column(name = "refrigerate_after_thawing_max")
	private Integer refrigerateAfterThawingMax;

	@Column(name = "refrigerate_after_thawing_metric")
	private String refrigerateAfterThawingMetric;

	@Column(name = "freeze_min")
	private Integer freezeMin;

	@Column(name = "freeze_max")
	private Integer freezeMax;

	@Column(name = "freeze_metric")
	private String freezeMetric;

	@Column(name = "freeze_tips")
	private String freezeTips;

	@Column(name = "dop_freeze_min")
	private Integer dop_freeze_min;

	@Column(name = "dop_freeze_max")
	private Integer dop_freeze_max;

	@Column(name = "dop_freeze_metric")
	private String dopFreezeMetric;

	@Column(name = "dop_freeze_tips")
	private String dopFreezeTips;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameSubtitle() {
		return nameSubtitle;
	}

	public void setNameSubtitle(String nameSubtitle) {
		this.nameSubtitle = nameSubtitle;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Integer getPantryMin() {
		return pantryMin;
	}

	public void setPantryMin(Integer pantryMin) {
		this.pantryMin = pantryMin;
	}

	public Integer getPantryMax() {
		return pantryMax;
	}

	public void setPantryMax(Integer pantryMax) {
		this.pantryMax = pantryMax;
	}

	public String getPantryMetric() {
		return pantryMetric;
	}

	public void setPantryMetric(String pantryMetric) {
		this.pantryMetric = pantryMetric;
	}

	public String getPantryTips() {
		return pantryTips;
	}

	public void setPantryTips(String pantryTips) {
		this.pantryTips = pantryTips;
	}

	public Integer getDopPantryMin() {
		return dopPantryMin;
	}

	public void setDopPantryMin(Integer dopPantryMin) {
		this.dopPantryMin = dopPantryMin;
	}

	public Integer getDopPantryMax() {
		return dopPantryMax;
	}

	public void setDopPantryMax(Integer dopPantryMax) {
		this.dopPantryMax = dopPantryMax;
	}

	public String getDopPantryMetric() {
		return dopPantryMetric;
	}

	public void setDopPantryMetric(String dopPantryMetric) {
		this.dopPantryMetric = dopPantryMetric;
	}

	public String getDopPantryTips() {
		return dopPantryTips;
	}

	public void setDopPantryTips(String dopPantryTips) {
		this.dopPantryTips = dopPantryTips;
	}

	public Integer getPantryAfterOpeningMin() {
		return pantryAfterOpeningMin;
	}

	public void setPantryAfterOpeningMin(Integer pantryAfterOpeningMin) {
		this.pantryAfterOpeningMin = pantryAfterOpeningMin;
	}

	public Integer getPantryAfterOpeningMax() {
		return pantryAfterOpeningMax;
	}

	public void setPantryAfterOpeningMax(Integer pantryAfterOpeningMax) {
		this.pantryAfterOpeningMax = pantryAfterOpeningMax;
	}

	public String getPantryAfterOpeningMetric() {
		return pantryAfterOpeningMetric;
	}

	public void setPantryAfterOpeningMetric(String pantryAfterOpeningMetric) {
		this.pantryAfterOpeningMetric = pantryAfterOpeningMetric;
	}

	public Integer getRefrigerateMin() {
		return refrigerateMin;
	}

	public void setRefrigerateMin(Integer refrigerateMin) {
		this.refrigerateMin = refrigerateMin;
	}

	public Integer getRefrigerateMax() {
		return refrigerateMax;
	}

	public void setRefrigerateMax(Integer refrigerateMax) {
		this.refrigerateMax = refrigerateMax;
	}

	public String getRefrigerateMetric() {
		return refrigerateMetric;
	}

	public void setRefrigerateMetric(String refrigerateMetric) {
		this.refrigerateMetric = refrigerateMetric;
	}

	public String getRefrigerateTips() {
		return refrigerateTips;
	}

	public void setRefrigerateTips(String refrigerateTips) {
		this.refrigerateTips = refrigerateTips;
	}

	public Integer getDopRefrigerateMin() {
		return dopRefrigerateMin;
	}

	public void setDopRefrigerateMin(Integer dopRefrigerateMin) {
		this.dopRefrigerateMin = dopRefrigerateMin;
	}

	public Integer getDopRefrigerateMax() {
		return dopRefrigerateMax;
	}

	public void setDopRefrigerateMax(Integer dopRefrigerateMax) {
		this.dopRefrigerateMax = dopRefrigerateMax;
	}

	public String getDopRefrigerateMetric() {
		return dopRefrigerateMetric;
	}

	public void setDopRefrigerateMetric(String dopRefrigerateMetric) {
		this.dopRefrigerateMetric = dopRefrigerateMetric;
	}

	public String getDopRefrigerateTips() {
		return dopRefrigerateTips;
	}

	public void setDopRefrigerateTips(String dopRefrigerateTips) {
		this.dopRefrigerateTips = dopRefrigerateTips;
	}

	public Integer getRefrigerateAfterOpeningMin() {
		return refrigerateAfterOpeningMin;
	}

	public void setRefrigerateAfterOpeningMin(Integer refrigerateAfterOpeningMin) {
		this.refrigerateAfterOpeningMin = refrigerateAfterOpeningMin;
	}

	public Integer getRefrigerateAfterOpeningMax() {
		return refrigerateAfterOpeningMax;
	}

	public void setRefrigerateAfterOpeningMax(Integer refrigerateAfterOpeningMax) {
		this.refrigerateAfterOpeningMax = refrigerateAfterOpeningMax;
	}

	public String getRefrigerateAfterOpeningMetric() {
		return refrigerateAfterOpeningMetric;
	}

	public void setRefrigerateAfterOpeningMetric(String refrigerateAfterOpeningMetric) {
		this.refrigerateAfterOpeningMetric = refrigerateAfterOpeningMetric;
	}

	public String getRefrigerateAfterThawingMin() {
		return refrigerateAfterThawingMin;
	}

	public void setRefrigerateAfterThawingMin(String refrigerateAfterThawingMin) {
		this.refrigerateAfterThawingMin = refrigerateAfterThawingMin;
	}

	public Integer getRefrigerateAfterThawingMax() {
		return refrigerateAfterThawingMax;
	}

	public void setRefrigerateAfterThawingMax(Integer refrigerateAfterThawingMax) {
		this.refrigerateAfterThawingMax = refrigerateAfterThawingMax;
	}

	public String getRefrigerateAfterThawingMetric() {
		return refrigerateAfterThawingMetric;
	}

	public void setRefrigerateAfterThawingMetric(String refrigerateAfterThawingMetric) {
		this.refrigerateAfterThawingMetric = refrigerateAfterThawingMetric;
	}

	public Integer getFreezeMin() {
		return freezeMin;
	}

	public void setFreezeMin(Integer freezeMin) {
		this.freezeMin = freezeMin;
	}

	public Integer getFreezeMax() {
		return freezeMax;
	}

	public void setFreezeMax(Integer freezeMax) {
		this.freezeMax = freezeMax;
	}

	public String getFreezeMetric() {
		return freezeMetric;
	}

	public void setFreezeMetric(String freezeMetric) {
		this.freezeMetric = freezeMetric;
	}

	public String getFreezeTips() {
		return freezeTips;
	}

	public void setFreezeTips(String freezeTips) {
		this.freezeTips = freezeTips;
	}

	public Integer getDop_freeze_min() {
		return dop_freeze_min;
	}

	public void setDop_freeze_min(Integer dop_freeze_min) {
		this.dop_freeze_min = dop_freeze_min;
	}

	public Integer getDop_freeze_max() {
		return dop_freeze_max;
	}

	public void setDop_freeze_max(Integer dop_freeze_max) {
		this.dop_freeze_max = dop_freeze_max;
	}

	public String getDopFreezeMetric() {
		return dopFreezeMetric;
	}

	public void setDopFreezeMetric(String dopFreezeMetric) {
		this.dopFreezeMetric = dopFreezeMetric;
	}

	public String getDopFreezeTips() {
		return dopFreezeTips;
	}

	public void setDopFreezeTips(String dopFreezeTips) {
		this.dopFreezeTips = dopFreezeTips;
	}

}