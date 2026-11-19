package com.therealyou.therealyou_api.salon.internal.mapper;

import com.therealyou.therealyou_api.salon.OfferingDto;
import com.therealyou.therealyou_api.salon.internal.model.Offering;
import java.util.List;
import org.mapstruct.Mapper;

@Mapper
public interface OfferingMapper {

    OfferingDto toDto(Offering offering);
    List<OfferingDto> toDtos(List<Offering> offerings);
}
