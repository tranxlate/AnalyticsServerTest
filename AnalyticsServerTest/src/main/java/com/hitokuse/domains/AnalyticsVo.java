package com.hitokuse.domains;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class AnalyticsVo extends RegisterVo {
	String seq;
	String path;
	String recTm;
	int val;
}
