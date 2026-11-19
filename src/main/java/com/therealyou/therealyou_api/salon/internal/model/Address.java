package com.therealyou.therealyou_api.salon.internal.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Embeddable
public class Address {

    @Column(nullable = false, length = 50)
    private String city;

    @Column(nullable = false, length = 50)
    private String municipality;

    @Column(nullable = false, length = 50)
    private String neighborhood;

    @Column(nullable = false)
    private String locationMarker;

}
