package shareprj.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.shareprj.service.BbsServiceIf;
import org.fullstack4.shareprj.dto.BbsDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
//스프링에 테스트 위임
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class BbsServiceTests {
    @Autowired(required = false)
    private BbsServiceIf bbsServiceIf ;

    @Test
    public void testRegist() {
        BbsDTO bbsDTO = BbsDTO.builder()
                .memberId("test")
                .title("제목 테스트")
                .content("내용 테스트")
                .todayCk("Y")
                .likeCnt(1)
                .build();

        log.info("bbsDTO : {}", bbsDTO);

        int result = bbsServiceIf.regist(bbsDTO);
    }

}

