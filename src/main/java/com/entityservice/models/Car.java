package com.entityservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Car extends BaseModel {

	@Column(unique = true, nullable = false)
	private String plateNumber;

	@ManyToOne
	private Color color;

	private String brand;

	private String model;

	@Enumerated(value = EnumType.STRING)
	private CarType carType;

	@OneToOne
	private Driver driver;
}