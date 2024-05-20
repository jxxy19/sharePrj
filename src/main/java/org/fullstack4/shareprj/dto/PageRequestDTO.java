package org.fullstack4.shareprj.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Min;
import javax.validation.constraints.PositiveOrZero;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Arrays;

@Log4j2 //배포할 때 제외해야 함
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageRequestDTO {
    @Builder.Default
    @PositiveOrZero
    @Min(value = 0)
    private int total_count = 0;
    @Builder.Default
    @PositiveOrZero
    @Min(value = 1)
    private int first_page = 1;
    @Builder.Default
    @PositiveOrZero
    @Min(value = 1)
    private int page = 1;
    @Builder.Default
    @PositiveOrZero
    @Min(value = 0)
    private int page_size = 10;
    @Builder.Default
    @PositiveOrZero
    @Min(value = 1)
    private int total_page = 1;
    @Builder.Default
    @PositiveOrZero
    @Min(value = 0)
    private int page_skip_count = 0;
    @Builder.Default
    @PositiveOrZero
    @Min(value = 1)
    private int page_block_size = 10;
    //    페이징 나오는 숫자 사이즈
    @Builder.Default
    @PositiveOrZero
    @Min(value = 1)
    private int page_block_start = 1;
    //    1~10 페이징 영역의 시작값
    @Builder.Default
    @PositiveOrZero
    @Min(value = 1)
    private int page_block_end = 1;
//    페이징 영역의 끝 값 ( 1이면 블럭사이즈의 끝값이 됨)

    private String[] search_type;
    //    private String search_type;
    private String search_word;
    private String search_date;
    private String search_date2;

    private String memberId;

    public void setTotal_count(int total_count) {
        this.total_count = total_count;
    }

    public int getPage_skip_count() {
        return (this.page - 1) * this.page_size;
    }
    public boolean checkType(String type) {
        if(search_type == null || search_type.length == 0) {
            return false;
        }
        return Arrays.stream(search_type).anyMatch(type::equals);
    }

    public String getLink() {
        StringBuilder builder = new StringBuilder();
        builder.append("page=" + this.page);
        builder.append("&size" + this.page_size);

        if(search_type != null && search_type.length > 0) {
            for(int i = 0; i<search_type.length; i++) {
                builder.append("&search_type=" + search_type[i]);
            }
        }

        if(search_word != null) {
            try {
                builder.append("&search_word=" + URLEncoder.encode(search_word,"UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        if(search_date != null) {
            builder.append("&search_date="+ search_date.toString());
        }

        if(search_date2 != null) {
            builder.append("search_date2="+ search_date2.toString());
        }

        return builder.toString();
    }
}

//    데이터베이스에 쿼리를 날리는 것 limit값 지정
//}
