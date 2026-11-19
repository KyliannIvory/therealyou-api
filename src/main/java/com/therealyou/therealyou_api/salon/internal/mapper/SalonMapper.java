package com.therealyou.therealyou_api.salon.internal.mapper;

import com.therealyou.therealyou_api.salon.AddressDto;
import com.therealyou.therealyou_api.salon.SalonDto;
import com.therealyou.therealyou_api.salon.internal.model.Address;
import com.therealyou.therealyou_api.salon.internal.model.Salon;
import org.mapstruct.Mapper;

@Mapper
public interface SalonMapper {

    SalonDto toDto(Salon salon);
    AddressDto toDto(Address address);
}
