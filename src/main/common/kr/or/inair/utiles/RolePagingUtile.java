package kr.or.inair.utiles;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.record.formula.functions.Function;
import org.springframework.stereotype.Component;

// 페이지네이션 UI 작성
//페이지네이션 UI 작성
@Component
public class RolePagingUtile {
	private int currentPage;		// 현재 페이지 번호
	private int totalCount;			// 전체 게시글 수
	private int blockCount = 10;	// 페이지별 출력 게시글 수
	private int totalPage;			// 전체 페이지 수
	private int blockPage = 5;		// 페이지별 출력 페이지네이션 넘버 수
	private int startPage;			// 페이지별 출력 페이지네이션 넘버 시작 페이지 번호
	private int endPage;			// 페이지별 출력 페이지네이션 넘버 끝 페이지 번호
	private int startCount; 		// 페이지별 출력 게시글 시작번호(rnum)			
	private int endCount;	 		// 페이지별 출력 게시글 끝번호(rnum)
	private int imgBlockCount = 5;
	private StringBuffer pagingHtmls;
	private HttpServletRequest request;
	
	public void makePagination(HttpServletRequest request, int totalCount, int currentPage, String search_keyword, String search_keycode) {
		  this.request = request;
	      this.totalCount = totalCount;
	      this.currentPage = currentPage;
	      this.pagingHtmls = new StringBuffer();
	      
	      if(search_keycode == null){
	         search_keycode = "";
	      }
	      
	      if(search_keyword == null){
	         search_keyword = "";
	      }
		
		// 전체 게시글 수(검색 O|X)
		this.totalPage =  (int)Math.ceil(this.totalCount / (double)this.blockCount);
		if(this.totalPage == 0){
			this.totalPage = 1;
		}
		
		// 현재페이지(currentPage)에 출력될 게시글의 시작번호, 끝번호
		this.startCount = this.totalCount - (this.currentPage -1) * this.blockCount;
		this.endCount = this.startCount - this.blockCount + 1;
		if(this.endCount < 0){
			this.endCount = 1;
		}
		
		// 페이지별 출력 페이지네이션 넘버의 시작, 끝 페이지 번호
		this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
		this.endPage = this.startPage + this.blockPage - 1;
		if(this.endPage > this.totalPage){
			this.endPage = this.totalPage;
		}
		
		this.pagingHtmls.append("<div class='col text-center'>");
		this.pagingHtmls.append(" <div class='block-27'>");
		this.pagingHtmls.append(" <ul>");
		
		String requestURI = this.request.getRequestURI();
		
		// 이전|1|2|3|4|5|다음
		if((this.currentPage - 1) == 0){
			this.pagingHtmls.append("<li class='disabled'><a href='#'>&lt;</a></li>");
		}else{
			this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + (this.currentPage - 1) + "&search_keycode="+ search_keycode +"&search_keyword="+search_keyword+"'>&laquo;</a></li>");
		}
		// |1|2|3|4|5|
		for(int i=this.startPage; i<=this.endPage; i++){
			if(this.currentPage == i){
				this.pagingHtmls.append("<li class='active'><a href='#'>" + i + "</a></li>");
			}else{
				this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + i + "&search_keycode="+ search_keycode +"&search_keyword="+search_keyword+"'>" + i + "</a></li>");
			}
		}
		// 다음
		if(this.currentPage < this.totalPage){
			this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + (this.currentPage + 1) + "&search_keycode="+ search_keycode +"&search_keyword="+search_keyword+"'>&raquo;</a></li>");
		}else{
			this.pagingHtmls.append("<li class='disabled'><a href='#'>&gt;</a></li>");
		}
		
		this.pagingHtmls.append("</ul></div></div>");
	}
	


	public void makeimgPagination(HttpServletRequest request, int totalCount, int currentPage, String search_keyword, String search_keycode) {
		  this.request = request;
	      this.totalCount = totalCount;
	      this.currentPage = currentPage;
	      this.pagingHtmls = new StringBuffer();
	      
	      if(search_keycode == null){
	         search_keycode = "";
	      }
	      
	      if(search_keyword == null){
	         search_keyword = "";
	      }
		
		// 전체 게시글 수(검색 O|X)
		this.totalPage =  (int)Math.ceil(this.totalCount / (double)this.imgBlockCount);
		if(this.totalPage == 0){
			this.totalPage = 1;
		}
		
		// 현재페이지(currentPage)에 출력될 게시글의 시작번호, 끝번호
		this.startCount = this.totalCount - (this.currentPage -1) * this.imgBlockCount;
		this.endCount = this.startCount - this.imgBlockCount + 1;
		if(this.endCount < 0){
			this.endCount = 1;
		}
		
		// 페이지별 출력 페이지네이션 넘버의 시작, 끝 페이지 번호
		this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
		this.endPage = this.startPage + this.blockPage - 1;
		if(this.endPage > this.totalPage){
			this.endPage = this.totalPage;
		}
		
		this.pagingHtmls.append("<div class='col text-center'>");
		this.pagingHtmls.append(" <div class='block-27'>");
		this.pagingHtmls.append(" <ul>");
		
		String requestURI = this.request.getRequestURI();
		
		// 이전|1|2|3|4|5|다음
		if((this.currentPage - 1) == 0){
			this.pagingHtmls.append("<li class='disabled'><a href='#'>&lt;</a></li>");
		}else{
			this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + (this.currentPage - 1) + "&search_keycode="+ search_keycode +"&search_keyword="+search_keyword+"'>&laquo;</a></li>");
		}
		// |1|2|3|4|5|
		for(int i=this.startPage; i<=this.endPage; i++){
			if(this.currentPage == i){
				this.pagingHtmls.append("<li class='active'><a href='#'>" + i + "</a></li>");
			}else{
				this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + i + "&search_keycode="+ search_keycode +"&search_keyword="+search_keyword+" '>" + i + "</a></li>");
			}
		}
		// 다음
		if(this.currentPage < this.totalPage){
			this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + (this.currentPage + 1) + "&search_keycode="+ search_keycode +"&search_keyword="+search_keyword+"'>&raquo;</a></li>");
		}else{
			this.pagingHtmls.append("<li class='disabled'><a href='#'>&gt;</a></li>");
		}
		
		this.pagingHtmls.append("</ul></div></div>");
	}
	
	
	
	public void adminPagination(HttpServletRequest request, int totalCount, int currentPage,
								String search_indvdl_id,
								String search_indvdl_name,
								String search_indvdl_mail,
								String search_gender,
								String search_indvdl_adres1_1,
								String search_indvdl_adres1_2,
								String search_fin_acdmcr_num,
								String search_hopepro_num) {
		this.request = request;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.pagingHtmls = new StringBuffer();
		
		if(search_indvdl_id == null){
			search_indvdl_id = "";
		}
		
		if(search_indvdl_name == null){
			search_indvdl_name = "";
		}
		
		if(search_indvdl_mail == null){
			search_indvdl_mail = "";
		}
		
		if(search_gender == null){
			search_gender = "";
		}
		
		if(search_indvdl_adres1_1 == null){
			search_indvdl_adres1_1 = "";
		}
		
		if(search_indvdl_adres1_2 == null){
			search_indvdl_adres1_2 = "";
		}
		
		if(search_fin_acdmcr_num == null){
			search_fin_acdmcr_num = "";
		}
		
		if(search_hopepro_num == null){
			search_hopepro_num = "";
		}
		
		// 전체 게시글 수(검색 O|X)
		this.totalPage =  (int)Math.ceil(this.totalCount / (double)this.blockCount);
		if(this.totalPage == 0){
			this.totalPage = 1;
		}
		
		// 현재페이지(currentPage)에 출력될 게시글의 시작번호, 끝번호
		this.startCount = (this.currentPage-1) * this.blockCount + 1;
		this.endCount = this.startCount + (this.blockCount-1) ;
		if(this.startCount == 0){
			this.startCount = 1;
		}
		
		// 페이지별 출력 페이지네이션 넘버의 시작, 끝 페이지 번호
		this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
		this.endPage = this.startPage + this.blockPage - 1;
		if(this.endPage > this.totalPage){
			this.endPage = this.totalPage;
		}
		

		/*
		<div class='fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix'>
        	<div class='dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers'>
        		<a tabindex="0" class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-disabled" id="DataTables_Table_0_first">첫페이지</a>
        		<a tabindex="0" class='previous fg-button ui-button ui-state-default ui-state-disabled' id='DataTables_Table_0_previous'>이전</a>
        		<span>
        			<a tabindex="0" class='fg-button ui-button ui-state-default ui-state-disabled'>1</a>
        			<a tabindex="0" class='fg-button ui-button ui-state-default'>2</a>
        			<a tabindex="0" class='fg-button ui-button ui-state-default'>3</a>
        			<a tabindex="0" class='fg-button ui-button ui-state-default'>4</a>
        			<a tabindex="0" class='fg-button ui-button ui-state-default'>5</a>
        		</span>
        		<a tabindex="0" class='next fg-button ui-button ui-state-default' id='DataTables_Table_0_next'>다음</a>
        		<a tabindex="0" class='last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default' id='DataTables_Table_0_last'>마지막페이지</a>
        	</div>
        </div>
		*/
		
		this.pagingHtmls.append(" <div class='dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers' id='dataTablesPaginate'>");
		
		String requestURI = this.request.getRequestURI();
		
		// 이전|1|2|3|4|5|다음
		if((this.currentPage - 1) == 0){
			this.pagingHtmls.append("<a href='#' class='previous fg-button ui-button ui-state-default ui-state-disabled' id='DataTables_Table_0_previous'>첫번째페이지</a>");
		}else{
			this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + (this.currentPage - 1) + "&search_indvdl_id="+ search_indvdl_id + "&search_indvdl_name="+ search_indvdl_name +"&search_indvdl_mail="+ search_indvdl_mail +"&search_gender="+ search_gender +"&search_indvdl_adres1_1="+ search_indvdl_adres1_1 +"&search_indvdl_adres1_2="+ search_indvdl_adres1_2 +"&search_fin_acdmcr_num="+ search_fin_acdmcr_num +"&search_hopepro_num="+ search_hopepro_num +"'class='previous fg-button ui-button ui-state-default' id='DataTables_Table_0_previous'>이전</a>");
		}
		
		this.pagingHtmls.append("<span>");
		
		// |1|2|3|4|5|
		for(int i=this.startPage; i<=this.endPage; i++){
			if(this.currentPage == i){
				this.pagingHtmls.append("<a href='#' class='fg-button ui-button ui-state-default ui-state-disabled'>" + i + "</a>");
			}else{
				this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + i + "&search_indvdl_id="+ search_indvdl_id + "&search_indvdl_name="+ search_indvdl_name +"&search_indvdl_mail="+ search_indvdl_mail +"&search_gender="+ search_gender +"&search_indvdl_adres1_1="+ search_indvdl_adres1_1 +"&search_indvdl_adres1_2="+ search_indvdl_adres1_2 +"&search_fin_acdmcr_num="+ search_fin_acdmcr_num +"&search_hopepro_num="+ search_hopepro_num +"' class='fg-button ui-button ui-state-default'>" + i + "</a>");
			}
		}
		
		this.pagingHtmls.append("</span>");
		
		// 다음
		if(this.currentPage < this.totalPage){
			this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + (this.currentPage + 1) + "&search_indvdl_id="+ search_indvdl_id + "&search_indvdl_name="+ search_indvdl_name +"&search_indvdl_mail="+ search_indvdl_mail +"&search_gender="+ search_gender +"&search_indvdl_adres1_1="+ search_indvdl_adres1_1 +"&search_indvdl_adres1_2="+ search_indvdl_adres1_2 +"&search_fin_acdmcr_num="+ search_fin_acdmcr_num +"&search_hopepro_num="+ search_hopepro_num +"' class='next fg-button ui-button ui-state-default' id='DataTables_Table_0_next'>다음</a>");
		}else{
			this.pagingHtmls.append("<a href='#' class='last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-disabled' id='DataTables_Table_0_last'>마지막페이지</a>");
		}
		
		this.pagingHtmls.append("</div>");
	}
	
	//관리자 기업회원 페이징네이션
	public void adminCompanyMemPagination(HttpServletRequest request, int totalCount, int currentPage,
										  String search_com_id,
									      String search_corp_name,
									      String search_ceo_nm,
									      String search_com_mail,
									      String search_bizr_no,
									      String search_addr1,
									      String search_addr2,
									      String lwinduty_num) {
		this.request = request;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.pagingHtmls = new StringBuffer();
		
		if(search_com_id == null){
			search_com_id = "";
		}
		
		if(search_corp_name == null){
			search_corp_name = "";
		}
		
		if(search_ceo_nm == null){
			search_ceo_nm = "";
		}
		
		if(search_com_mail == null){
			search_com_mail = "";
		}
		
		if(search_bizr_no == null){
			search_bizr_no = "";
		}
		
		if(search_addr1 == null){
			search_addr1 = "";
		}
		
		if(search_addr2 == null){
			search_addr2 = "";
		}
		
		if(lwinduty_num == null){
			lwinduty_num = "";
		}
		
		// 전체 게시글 수(검색 O|X)
		this.totalPage =  (int)Math.ceil(this.totalCount / (double)this.blockCount);
		if(this.totalPage == 0){
			this.totalPage = 1;
		}
		
		// 현재페이지(currentPage)에 출력될 게시글의 시작번호, 끝번호
		this.startCount = (this.currentPage-1) * this.blockCount + 1;
		this.endCount = this.startCount + (this.blockCount-1) ;
		if(this.startCount == 0){
			this.startCount = 1;
		}
		
		// 페이지별 출력 페이지네이션 넘버의 시작, 끝 페이지 번호
		this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
		this.endPage = this.startPage + this.blockPage - 1;
		if(this.endPage > this.totalPage){
			this.endPage = this.totalPage;
		}
		
		this.pagingHtmls.append(" <div class='dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers' id='dataTablesPaginate'>");
		
		String requestURI = this.request.getRequestURI();
		
		// 이전|1|2|3|4|5|다음
		if((this.currentPage - 1) == 0){
			this.pagingHtmls.append("<a href='#' class='previous fg-button ui-button ui-state-default ui-state-disabled' id='DataTables_Table_0_previous'>첫번째페이지</a>");
		}else{
			this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + (this.currentPage - 1) + "&search_com_id="+ search_com_id + "&search_corp_name="+ search_corp_name +"&search_ceo_nm="+ search_ceo_nm +"&search_com_mail="+ search_com_mail +"&search_bizr_no="+ search_bizr_no +"&search_addr1="+ search_addr1 +"&search_addr2="+ search_addr2 +"&lwinduty_num="+ lwinduty_num +"'class='previous fg-button ui-button ui-state-default' id='DataTables_Table_0_previous'>이전</a>");
		}
		
		this.pagingHtmls.append("<span>");
		
		// |1|2|3|4|5|
		for(int i=this.startPage; i<=this.endPage; i++){
			if(this.currentPage == i){
				this.pagingHtmls.append("<a href='#' class='fg-button ui-button ui-state-default ui-state-disabled'>" + i + "</a>");
			}else{
				this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + i + "&search_com_id="+ search_com_id + "&search_corp_name="+ search_corp_name +"&search_ceo_nm="+ search_ceo_nm +"&search_com_mail="+ search_com_mail +"&search_bizr_no="+ search_bizr_no +"&search_addr1="+ search_addr1 +"&search_addr2="+ search_addr2 +"&lwinduty_num="+ lwinduty_num +"' class='fg-button ui-button ui-state-default'>" + i + "</a>");
			}
		}
		
		this.pagingHtmls.append("</span>");
		
		// 다음
		if(this.currentPage < this.totalPage){
			this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + (this.currentPage + 1) + "&search_com_id="+ search_com_id + "&search_corp_name="+ search_corp_name +"&search_ceo_nm="+ search_ceo_nm +"&search_com_mail="+ search_com_mail +"&search_bizr_no="+ search_bizr_no +"&search_addr1="+ search_addr1 +"&search_addr2="+ search_addr2 +"&lwinduty_num="+ lwinduty_num +"' class='next fg-button ui-button ui-state-default' id='DataTables_Table_0_next'>다음</a>");
		}else{
			this.pagingHtmls.append("<a href='#' class='last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-disabled' id='DataTables_Table_0_last'>마지막페이지</a>");
		}
		
		this.pagingHtmls.append("</div>");
	}
	
	

	public int getStartCount() {
		return startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public String getPagingHtmls() {
		return pagingHtmls.toString();
	}
	//관리자 게시판 페이지 네이션
	public void adminBoardPagination(HttpServletRequest request, int totalCount, int currentPage, String search_keyword, String search_keycode) {
		this.request = request;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.pagingHtmls = new StringBuffer();
		
	    if(search_keycode == null){
	        search_keycode = "";
	     }
	     
	     if(search_keyword == null){
	        search_keyword = "";
	     }
	     
	  // 전체 게시글 수(검색 O|X)
		this.totalPage =  (int)Math.ceil(this.totalCount / (double)this.blockCount);
		if(this.totalPage == 0){
			this.totalPage = 1;
		}
			
		// 현재페이지(currentPage)에 출력될 게시글의 시작번호, 끝번호
		this.startCount = this.totalCount - (this.currentPage -1) * this.blockCount;
		this.endCount = this.startCount - this.blockCount + 1;
		if(this.endCount < 0){
				this.endCount = 1;
		}
		
		// 페이지별 출력 페이지네이션 넘버의 시작, 끝 페이지 번호
		this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
		this.endPage = this.startPage + this.blockPage - 1;
		if(this.endPage > this.totalPage){
			this.endPage = this.totalPage;
		}
			
		
		/*
			<div class='fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix'>
	        	<div class='dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers'>
	        		<a tabindex="0" class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-disabled" id="DataTables_Table_0_first">첫페이지</a>
	        		<a tabindex="0" class='previous fg-button ui-button ui-state-default ui-state-disabled' id='DataTables_Table_0_previous'>이전</a>
	        		<span>
	        			<a tabindex="0" class='fg-button ui-button ui-state-default ui-state-disabled'>1</a>
	        			<a tabindex="0" class='fg-button ui-button ui-state-default'>2</a>
	        			<a tabindex="0" class='fg-button ui-button ui-state-default'>3</a>
	        			<a tabindex="0" class='fg-button ui-button ui-state-default'>4</a>
	        			<a tabindex="0" class='fg-button ui-button ui-state-default'>5</a>
	        		</span>
	        		<a tabindex="0" class='next fg-button ui-button ui-state-default' id='DataTables_Table_0_next'>다음</a>
	        		<a tabindex="0" class='last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default' id='DataTables_Table_0_last'>마지막페이지</a>
	        	</div>
	        </div>
		 */
		
		this.pagingHtmls.append(" <div class='dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers' id='dataTablesPaginate'>");
		
		String requestURI = this.request.getRequestURI();
		
		// 이전|1|2|3|4|5|다음
		if((this.currentPage - 1) == 0){
			this.pagingHtmls.append("<a href='#' class='previous fg-button ui-button ui-state-default ui-state-disabled' id='DataTables_Table_0_previous'>첫번째페이지</a>");
		}else{
			this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + (this.currentPage - 1)+"&search_keycode="+ search_keycode +"&search_keyword="+search_keyword+"'class='previous fg-button ui-button ui-state-default' id='DataTables_Table_0_previous'>이전</a>");
		}
		
		this.pagingHtmls.append("<span>");
		
		// |1|2|3|4|5|
		for(int i=this.startPage; i<=this.endPage; i++){
			if(this.currentPage == i){
				this.pagingHtmls.append("<a href='#' class='fg-button ui-button ui-state-default ui-state-disabled'>" + i + "</a>");
			}else{
				this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" +i+"&search_keycode="+ search_keycode +"&search_keyword="+search_keyword+"' class='fg-button ui-button ui-state-default'>" + i + "</a>");
			}
		}
		
		this.pagingHtmls.append("</span>");
		
		// 다음
		if(this.currentPage < this.totalPage){
			this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + (this.currentPage + 1) +"&search_keycode="+ search_keycode +"&search_keyword="+search_keyword+"' class='next fg-button ui-button ui-state-default' id='DataTables_Table_0_next'>다음</a>");
		}else{
			this.pagingHtmls.append("<a href='#' class='last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-disabled' id='DataTables_Table_0_last'>마지막페이지</a>");
		}
		this.pagingHtmls.append("</div>");
	}
}







