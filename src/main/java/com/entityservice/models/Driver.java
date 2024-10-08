package com.entityservice.models;
import java.util.List;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
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
public class Driver extends BaseModel {

	private String name;

	@Column(nullable = false, unique = true)
	private String licenseNumber;

	private String phoneNumber;

	@OneToMany(mappedBy = "driver")
	@Fetch(FetchMode.SUBSELECT)
	private List<Booking> bookings;
}