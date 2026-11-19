package com.therealyou.therealyou_api.salon;

import com.therealyou.therealyou_api.TestcontainersConfiguration;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.modulith.test.ApplicationModuleTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.transaction.annotation.Transactional;
import static org.assertj.core.api.Assertions.*;

@ApplicationModuleTest
@Import(TestcontainersConfiguration.class)
@Transactional
@Sql("/test-data/salons.sql")
public class SalonModuleTests {

    private static final UUID SALON_ID = UUID.fromString("11111111-1111-4111-8111-111111111111");

    @Autowired
    SalonFacade salonFacade;

    @Autowired
    JdbcTemplate jdbc;

    @Test
    void findSalon_returnsSalonWithAddress_whenItExists() {
        Optional<SalonDto> result = salonFacade.findSalon(SALON_ID);

        assertThat(result).isPresent();
        assertThat(result.get().address().municipality()).isEqualTo("Cocody");
    }

    @Test
    void findSalon_returnsEmpty_whenItDoesNotExists() {
        assertThat(salonFacade.findSalon(UUID.randomUUID())).isEmpty();
    }

    @Test
    void findOfferingsBySalonId_returnsOnlyOfferingsOfThatSalon() {
        assertThat(salonFacade.findOfferingsBySalonId(SALON_ID)).hasSize(2);
    }

    @Test
    void database_rejectsOfferingWithZeroDuration() {
        assertThatThrownBy(() -> jdbc.update("""
                INSERT INTO offering (id, name, category, duration_in_minutes, price_xof, salon_id)
                VALUES (gen_random_uuid(), 'Test', 'BARBER', 0, 1000, ?)
                """, SALON_ID))
                .isInstanceOf(DataIntegrityViolationException.class);
    }
}
