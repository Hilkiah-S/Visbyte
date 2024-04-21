import axios from "axios";

const Test = () => {
  const handleSubmit = async () => {
    const sendi =
      "I’m sorry, but I don’t want to be an emperor. That’s not my business. I don’t want to rule or conquer anyone. I should like to help everyone if possible; Jew, Gentile, black man, white, we all want to help one another. Human beings are like that. We want to live by each other’s happiness, not by each other’s misery. We don’t want to hate and despise one another. In this world there’s room for everyone and the good Earth is rich and can provide for everyone. The way of life can be free and beautiful, but we have lost the way. Greed has poisoned men’s souls, has barricaded the world with hate, has goose-stepped us into misery and bloodshed. Charlie Chaplin: (00:40)We have developed speed, but we have shut ourselves in. Machinery that gives abundance has left us in want. Our knowledge has made us cynical. Our cleverness hard and unkind. We think too much and feel too little. More than machinery, we need humanity. More than cleverness, we need kindness and gentleness. Without these qualities, life will be violent and all will be lost. The aeroplane and the radio have brought us closer together. The very nature of these inventions cries out for the goodness in men, cries out for universal brotherhood for the unity of a soul.Charlie Chaplin: (01:12)Even now my voice is reaching millions throughout the world. Millions of despairing, men, women, and little children, victims of a system that makes men torture and imprison innocent people. To those are going to hear me, I say do not despair. The misery that is now upon us, but the passing of greed, the bitterness of men who fear the way of human progress, the hate of men will pass and dictators die. And the power they took from the people will return to the people. And so long as men die, liberty will never perish.Charlie Chaplin: (01:45)Soldiers, don’t give you a sales to brutes. Men who despise you, enslave you, who regiment your lives, tell you what to do, what to think and what to feel. Who drill you, diet you, treat you like cattle, use you as cannon fodder. Don’t give yourself to these unnatural men, machine men with machine minds and machine hearts. You are not machines. You are not cattle. You are men. You have the love of humanity in your hearts. You don’t hate. Only the unloved hate, the unloved and the unnatural.Charlie Chaplin: (02:14)";
    const encodedParams = new URLSearchParams();
    encodedParams.set("voice_code", "en-US-1");
    encodedParams.set("text", sendi);
    encodedParams.set("speed", "1.00");
    encodedParams.set("pitch", "1.00");
    encodedParams.set("output_type", "audio_url");

    const options = {
      method: "POST",
      url: "https://cloudlabs-text-to-speech.p.rapidapi.com/synthesize",
      headers: {
        "content-type": "application/x-www-form-urlencoded",
        "X-RapidAPI-Key": "895f17ba78mshd004bc844e2d529p121fc7jsn09c2a01a6008",
        "X-RapidAPI-Host": "cloudlabs-text-to-speech.p.rapidapi.com",
      },
      data: encodedParams,
    };

    try {
      const response = await axios.request(options);
      console.log(response.data);
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <div>
      <button onClick={handleSubmit}>Click here</button>
    </div>
  );
};

export default Test;
