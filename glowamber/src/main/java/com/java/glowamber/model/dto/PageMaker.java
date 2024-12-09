package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class PageMaker {

	private Integer pageNum;		// 페이지번호
	private Integer totalBoard;		// 게시글의 개수
	private Integer pageSize;		// 페이지에 출력되는 게시글 개수
	private Integer blockSize;		// 한블럭에 출력되는 페이지 번호 개수
	private Integer totalPage;		// 전체 페이지 개수
	private Integer startRow;		// 요청 페이지에 출력되는 게시글의 시작 행번호
	private Integer endRow;			// 요청 페이지에 출력되는 게시글의 종료 행번호
	private Integer startPage;		// 블럭에 출력되는 시작 페이지 번호
	private Integer endPage;		// 블럭에 출력되는 종료 페이지 번호
	private Integer prevPage;		// 이전 블럭에 출력되는 시작 페이지 번호
	private Integer nextPage;		// 다음 블럭에 출력되는 시작 페이지 번호
	
	// 생성자
	public PageMaker(Integer pageNum, Integer totalBoard , Integer pageSize, Integer blockSize) {
		super();
		this.pageNum = pageNum;
		this.totalBoard = totalBoard;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		
		calcPage();
	}
	
	private void calcPage() {
		// 총 게시물 수에 페이지당 표시되는 게시물 수를 나눠 전체 페이지의 개수를 구함
		totalPage = (int)Math.ceil((double)totalBoard/pageSize);
		
		// 페이지 번호가 전체 페이지 수 보다 큰 경우 페이지 번호를 1로 설정
		if(pageNum <= 0 || pageNum>totalPage) {
			pageNum=1;
		}
		
		// 시작 및 끝 행 번호
		startRow =(pageNum-1)*pageSize+1;
		endRow=pageNum*pageSize;
		if(endRow>totalBoard) {
			endRow = totalBoard;
		}
		
		// 한 블럭에 출력되는 행 개수를 기준으로 페이지 번호를 계산
		startPage = (pageNum - 1)/blockSize*blockSize+1;
		endPage = startPage + blockSize - 1;
		if(endPage>totalPage) {
			endPage = totalPage;
		}
		// 이전 및 다음 블럭의 시작 페이지 번호 계산
		prevPage = startPage - blockSize;
		nextPage = startPage + blockSize;
	}
}
