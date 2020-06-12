package kr.or.inair.vo;

import java.util.List;

public class AIIMTResultVO {
	private String face_anger;
	private String face_contempt;
	private String face_disgust;
	private String face_fear;
	private String face_happiness;
	private String face_neutral;
	private String face_sadness;
	private String face_surprise;
	
	private String voice_calm;
	private String voice_anger;
	private String voice_happiness;
	private String voice_sadness;
	private String voice_vitality;
	
	private String voicePositive;
	private String voiceNegative;
	private String voiceNeutrality;
	
	private List<Word_arrayVO> wordArrayResult;

	public String getFace_anger() {
		return face_anger;
	}

	public void setFace_anger(String face_anger) {
		this.face_anger = face_anger;
	}

	public String getFace_contempt() {
		return face_contempt;
	}

	public void setFace_contempt(String face_contempt) {
		this.face_contempt = face_contempt;
	}

	public String getFace_disgust() {
		return face_disgust;
	}

	public void setFace_disgust(String face_disgust) {
		this.face_disgust = face_disgust;
	}

	public String getFace_fear() {
		return face_fear;
	}

	public void setFace_fear(String face_fear) {
		this.face_fear = face_fear;
	}

	public String getFace_happiness() {
		return face_happiness;
	}

	public void setFace_happiness(String face_happiness) {
		this.face_happiness = face_happiness;
	}

	public String getFace_neutral() {
		return face_neutral;
	}

	public void setFace_neutral(String face_neutral) {
		this.face_neutral = face_neutral;
	}

	public String getFace_sadness() {
		return face_sadness;
	}

	public void setFace_sadness(String face_sadness) {
		this.face_sadness = face_sadness;
	}

	public String getFace_surprise() {
		return face_surprise;
	}

	public void setFace_surprise(String face_surprise) {
		this.face_surprise = face_surprise;
	}

	public String getVoice_calm() {
		return voice_calm;
	}

	public void setVoice_calm(String voice_calm) {
		this.voice_calm = voice_calm;
	}

	public String getVoice_anger() {
		return voice_anger;
	}

	public void setVoice_anger(String voice_anger) {
		this.voice_anger = voice_anger;
	}

	public String getVoice_happiness() {
		return voice_happiness;
	}

	public void setVoice_happiness(String voice_happiness) {
		this.voice_happiness = voice_happiness;
	}

	public String getVoice_sadness() {
		return voice_sadness;
	}

	public void setVoice_sadness(String voice_sadness) {
		this.voice_sadness = voice_sadness;
	}

	public String getVoice_vitality() {
		return voice_vitality;
	}

	public void setVoice_vitality(String voice_vitality) {
		this.voice_vitality = voice_vitality;
	}

	public List<Word_arrayVO> getWordArrayResult() {
		return wordArrayResult;
	}

	public void setWordArrayResult(List<Word_arrayVO> wordArrayResult) {
		this.wordArrayResult = wordArrayResult;
	}

	public String getVoicePositive() {
		return voicePositive;
	}

	public void setVoicePositive(String voicePositive) {
		this.voicePositive = voicePositive;
	}

	public String getVoiceNegative() {
		return voiceNegative;
	}

	public void setVoiceNegative(String voiceNegative) {
		this.voiceNegative = voiceNegative;
	}

	public String getVoiceNeutrality() {
		return voiceNeutrality;
	}

	public void setVoiceNeutrality(String voiceNeutrality) {
		this.voiceNeutrality = voiceNeutrality;
	}
	
}