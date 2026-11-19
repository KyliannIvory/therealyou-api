package com.therealyou.therealyou_api.salon;

import java.util.UUID;

public record SalonDto(
        UUID id,
        String name,
        String description,
        String phone,
        AddressDto address
) {
}
