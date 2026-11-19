package com.therealyou.therealyou_api.salon;

import java.util.UUID;

public record OfferingDto(
        UUID id,
        String name,
        Category category,
        short durationInMinutes,
        int priceXof
) {
}
