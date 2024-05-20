package shareprj.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.shareprj.mapper.BbsMapper;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations ="file:src/main/webapp/WEB-INF/root-context.xml")
public class BbsMapperTests {
    @Autowired(required = false) // 초기에는 없으니 생성하지말고 나중에 생성해!
    private BbsMapper bbsMapper;


}
