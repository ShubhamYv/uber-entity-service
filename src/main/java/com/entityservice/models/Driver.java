package com.entityservice.models;

import java.util.List;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler", "bookings" })
public class Driver extends BaseModel {

	private String name;

	@Column(nullable = false, unique = true)
	private String licenseNumber;

	private String phoneNumber;

	private String aadharCard;

	@OneToOne(mappedBy = "driver", cascade = CascadeType.ALL)
	private Car car;

	@Enumerated(value = EnumType.STRING)
	private DriverApprovalStatus driverApprovalStatus;

	@OneToOne
	private ExactLocation lastKnownLocation;

	@OneToOne
	private ExactLocation home;

	private String activeCity;

	@DecimalMin(value = "0.00", message = "Rating must be grater than or equal to 0.00")
	@DecimalMax(value = "5.00", message = "Rating must be less than or equal to 5.00")
	private Double rating;

	private boolean isAvailable;

	// 1 : n , Driver : Booking
	@OneToMany(mappedBy = "driver")
	@Fetch(FetchMode.SUBSELECT)
	private List<Booking> bookings;
}