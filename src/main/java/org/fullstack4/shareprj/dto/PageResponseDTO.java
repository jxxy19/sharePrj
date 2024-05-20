package org.fullstack4.shareprj.dto;

import lombok.Builder;
import lombok.Data;
import lombok.extern.log4j.Log4j2;

import java.util.Arrays;
import java.util.List;
@Log4j2
@Data

public class PageResponseDTO<E> { //제네릭 (어떤 게시판인지 유형에 따라 쓸 수 있게_)
    private int total_count;
    private int page;
    private int page_size;
    private int page_skip_count;
    private int total_page;
    private int page_block_size;
    private int page_block_start;
    private int page_block_end;

    private boolean prev_page_flag;
    private boolean next_page_flag;

    List<E> dtoList;

//    private String search_type;
    private String [] search_type;
    private String search_word;
    private String search_date;
    private String search_date2;
    private String linkParams;

    private String memberId;
    PageResponseDTO() {} //빈으로 등록될 것이기 때문에 아무것도 업는 생성자 생성

    @Builder(builderMethodName = "withAll" )
    public PageResponseDTO(PageRequestDTO requestDTO, List<E> dtoList, int total_count) {
        log.info("=================================");
        log.info("PageResponseDTO START");

        this.total_count = total_count;
        this.page = requestDTO.getPage();
        this.page_size = requestDTO.getPage_size();
        this.page_skip_count = (this.page-1)*this.page_size;
        this.total_page = (this.total_count > 0 ? (int)Math.ceil(this.total_count/(double)this.page_size) : 1);
        this.page_block_size = requestDTO.getPage_block_size();
//        this.page_block_start = requestDTO.getPage_block_start();
//        this.page_block_end = requestDTO.getPage_block_end();
        this.setPage_block_start();
        this.setPage_block_end();
        this.prev_page_flag = (this.page_block_start > 1);
        this.next_page_flag = (this.total_page > this.page_block_end);
        this.dtoList = dtoList;
        this.search_type= requestDTO.getSearch_type();
        this.search_word = requestDTO.getSearch_word();
        this.search_date = requestDTO.getSearch_date();
        this.search_date2 = requestDTO.getSearch_date2();
//        StringBuilder sb = new StringBuilder() ;
//        if()
//        this.linkParams = "?page_size=" + this.page_size;

        StringBuilder sb = new StringBuilder("?page_size" + this.page_size);
        if(search_type != null) sb.append("&search_type=" + search_type[0]);
        if(search_word != null) sb.append("&search_word=" + search_word);
        if(search_date != null) sb.append("&search_date=" + search_date);
        if(search_date2 != null) sb.append("&search_date2=" + search_date2);

        this.linkParams = sb.toString();
        log.info("linkParams : "+linkParams);


        log.info("PageResponseDTO END");
        log.info("=================================");
    }
    public int getTotal_page() {
        return ( this.total_count > 0 ? (int)Math.ceil(this.total_count / (double)this.page_size):1);

    }
    public int getPage_skip_count() {
        return (this.page-1) * this.page_size;
    }
    public void setPage_block_start() {
        this.page_block_start = ((this.page % (double)this.page_block_size == 0.0) ? (((int)Math.floor((this.page/(double)this.page_block_size)-1) * this.page_block_size) +1):
                ((int)Math.floor(this.page/(double)this.page_block_size) * this.page_block_size) +1);
    }
    public void setPage_block_end() {
        this.page_block_end = ((this.page % (double)this.page_block_size==0)?((int)Math.floor(this.page/(double)this.page_block_size)*this.page_block_size) :
                ((int)Math.floor(this.page/(double)this.page_block_size)*this.page_block_size) + this.page_block_size);
        this.page_block_end = (this.total_page > this.page_block_end ? this.page_block_end : this.total_page);
    }



}
//DB 값을 가져옴
