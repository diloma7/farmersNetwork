import 'package:farmers_network/pages/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF8EBA43), Color(0xFF4B7447)],
                  begin: const FractionalOffset(0.5, 0.0),
                  end: const FractionalOffset(0.6, 0.6),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(top: 50.0)),
                ],
              ),
              Text(
                'FARMERS',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'NETWORKS',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: new EdgeInsets.all(20.0),
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 1.0),
                child: Column(children: <Widget>[
                  Text(
                    'Terms & Conditions for Use of this app',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'TERMS OF SERVICE INFOAGE SOLUTIONS LIMITED. Infoage Solutions Limited provides the services and necessary technology that enables and allows you to connect with other people on a personal level, in local and or global communities and third party apps and giving you the necessary technology to grow your business.  These Terms of Service dictate the way you, as an individual or a corporation use Infoage Solutions Limited Services and technology, and the software we own and manage that collectively are and remain the Infoage Solutions Limited Products, except where we expressly state that separate terms, and not these should be referred to and applied. These Products are provided to you by Infoage Solutions Limited. YOUR PERSONAL DATA: i.\n    tWhile we do not charge you to use Infoage Solutions Limited, businesses and organizations pay us to show you ads for their products and or services of which are not part of Infoage Solutions Limited Products and we do not endorse them either way; your decision to engage any advertiser regarding their products and or services should not be based on the assumption that we endorse the advertiser’s products and or services. We will not take any responsibility for any damage resulting from your dealings with any of our advertisers. ii.\n    tBy using our Products, you agree that we can show you ads that may or may not be relevant to you or your interests.  iii.\t Protecting people\'s privacy is crucial and central to the way we have designed our ad system. This means that we can show you relevant and useful ads based on your preferences without telling advertisers who you are and at the same time denying the advertisers the power, technology  and capability to drop trackers on you whilst you are logged into Infoage Solutions Limited Products, but, should you follow an advertisers link that navigates out of Infoage Solutions Limited to the advertiser’s website or product, then, advertisers can and or will track how you interact with their website or products iv.\n    tWe do not sell your personal data to advertisers neither sharing information that directly identifies you such as your name, email address or other contact information, unless you give us specific permissions allowing us to do so v.\n    tAdvertisers can target their products and or services to a very specific audience that they want to see their ads based on parameters we have set in our ads system such as age, location, gender etc and we will show those ads to people who may be targeted by each advertiser. vi.\n    tWe provide each advertiser with reports and analytics regarding the performance of their ads that help them analyze how people are interacting with their ads across different platforms.  OUR DATA POLICY: What information do we collect?  i.\n    tCookies and Cached Data: -\n    tWe save, update, use and read Cookies and cached Data. ii.\n    tBrowsers, Devices and IP address:  -\n    tWe collect and log information about your device type (mobile or desktop), operating system (windows, mac or Linux), browser type (Mozilla, Chrome, etc.) and the IP address used to log into your account. iii.\n    tContent and information personally provided by you: -\n    tWe collect the content, information and communication that you personally provide when you use Infoage Solutions Limited Products including but not limited to, when you sign up for an account, create or share content, and message or communicate with others. iv.\n    tNetworks and connections:  -\n    tWe collect information about the people or accounts, groups, pages, tags and hashtags you are connected to and how you interact with them across Infoage Solutions Limited Products. v.\n    t Information about transactions made on Infoage Solutions Limited Products:  -\n    tWe collect personal information about the purchases or transactions you do while interacting with Infoage Solutions Limited Products. This includes and not limited to payment information, such as your credit or debit card number and other card information; other account and authentication information; and billing, shipping and contact details. vi.\n    tInteractions:  -\n    tWe may also receive and analyze content related to you and also communications and information that other people provide when they use our Products. This can include but not limited to information about you eg when others share or comment on a photo of you, send a message to you. For efficient and smooth operation of Infoage Solutions Limited Products, we save, update, use and read Cookies and cached data. Signing up and using any of Infoage Solutions Limited Products denotes your acceptance of our cookies and data policy. If you do not accept cookies, please do not use Infoage Solutions Limited Products.  USAGE OF INFOAGE SOLUTIONS LIMITED: 1.\n    tYou must:  i.\n    tUse the same name(s) that identifies you in everyday life – real or know nick names ii.\n    tProvide accurate information about yourself – age, gender, country, profile picture etc. iii.\n    tCreate your account (your own not a parody) and use it for personal purposes only. 2.\n    tYou cannot use Infoage Solutions Limited if:  i.\n    tYou are a convicted sex offender. ii.\n    tTo be specific , if you a pedophile  iii.\n    tYou are under age; with our minimum age limit being 13 years old or the minimum legal age limit in your country for usage of social media. iv.\n    tYou are prohibited under applicable laws both local and global from using our products 3.\n    tYou should not use our Products to do or share anything:  i.\n    tThat violates our Terms of service and that apply to your use of Infoage Solutions Limited Products. ii.\n    tThat is unlawful, fraudulent, misleading or discriminatory in any way iii.\n    tThat violates or infringes on someone else\'s rights, including their intellectual property rights. 4.\n    tYou should not upload malicious code or viruses or doing anything that could affect the proper working of Infoage Solutions Limited Products. 5.\n    tYou should not access or collect data from Infoage Solutions Limited Products using whatever means and without our prior written permission or attempt to access Infoage Solutions Limited Products’ data that you do not have access privileges and rights. 6.\n    tWe can limit or permanently ban your access to your own content, services or information if we determine that doing so is reasonably necessary due to your infringing on our rights  or to avoid or mitigate legal or any regulatory impacts to Infoage Solutions Limited Products or any of our affiliates. THE PERMISSIONS YOU GIVE US: i.\n    tSome, if not all of the content that you upload or share, such as photos or videos or downloadable apps, may be protected by intellectual property laws and we need Permission to use the content you create and share in our service delivery, and by uploading them on Infoage Solutions Limited Products, you explicitly give us legal permissions and extensions of the same rights you have to use them but in a manner that does not take away your intellectual property rights. ii.\n    tWhat you own is yours; and nothing in these Terms takes away the rights you have to your own content.  You own the intellectual property rights in any such content that you create and share on Infoage Solutions Limited Products. But, we need you to give us legal permissions (called in this Terms of Service: ‘license’) to use this content, solely for the purposes of providing and improving our Products and services.  iii.\n    tIn your using Infoage Solutions Limited Products, when you share, post, or upload content that is covered by intellectual property rights, you grant us a non-exclusive, transferable, sub-licensable, royalty-free, and worldwide license to share, use, modify, distribute, host,  run, copy, translate,  publicly perform or display, and create derivative works of your content. This license will expire when all of your content is deleted from our systems.  a.\n    tYou can delete content individually or all at once by deleting your account from your settings tab in your account. b.\n    tWhen you delete content, it’s no longer visible to other users, but it may continue to exist elsewhere on our systems where:  •\n    timmediate deletion is not possible at all due to technical limitations on our part and in which case, your content will be deleted within a maximum of 90 days from when you delete it;  •\n    tyour content has been used by others but in accordance with this license and they have not deleted it from their end and in which case this license shall continue to apply until that content is deleted);  •\n    t immediate deletion would hinder or in some way, technical or otherwise  slow our ability to:  i.\n    t Identify and or investigate illegal activity and or activities or violations of our terms and policies. e.g. to identify and or investigate misuse of our Products; ii.\n    tComply with a request of an administrative or judicial authority, government agency or a law enforcement body in preservation of data deemed as evidence for whatever reason. c.\n    tIn which case, the content shall be retained but not longer than is necessary for the purposes for which it has been retained, but the exact duration of data retention will vary on a case-by-case basis.  d.\n    tIn each of the above cases, this license will continue until all the content has been fully deleted.  iv.\n    tPermission to use your name, profile picture, information, and uploaded content: a.\n    tYou give us permission to use your name and profile picture, information, posts and usage analytics without any compensation to you.  v.\n    tPermission to update Infoage Solutions Limited Products for  your use or download: a.\n    tIf you download or use Infoage Solutions Limited products, you give us permission to download and install updates to our products where available.LIMITS ON USING OUR INTELLECTUAL PROPERTY: We retain all rights to our products from the source code to images, designs, videos, or sounds.  If you use our content that is covered by intellectual property rights, we retain all rights to that content. You can only use our copyrights or trademarks only if you obtain written permission from us to modify, decompile, extract source code or create derivative works of. UPDATING OUR TERMS: We may need to update these Terms from time to time to accurately reflect our services and practices. We will only make any changes if the provisions are no longer appropriate or if they are incomplete. We will endeavor to notify you through the email used in the registration of your account at least 14 days before we make changes to these Terms and give you an opportunity to review them before they go into effect, unless the changes are urgent and required by law. Once any updated Terms are in effect, you will be bound by them if you continue to use our Products.  If you do not agree to our updated Terms and no longer want to be a part of the Infoage Solutions Limited Community, you can delete your account at any time; but your continued use of our products means acceptance our Terms of service ACCOUNT DELETION & SUSPENSION:  i.\n    tIf we determine that you have clearly breached our Terms and or Policies, including our Community Standards, we may suspend or permanently disable access to your account. We may also decide to suspend or permanently disable your account if you repeatedly infringe other people’s intellectual property rights or where we are required to do so for legal reasons.  •\n    tWe may reach out to you with options you have to request a review for the decision, unless doing so may compromise or interfere with the integrity of our Products, expose us or others to legal dispute, harm other users; or where we are restricted due to obvious and unavoidable technical limitations; or where we are prohibited from doing so for legal reasons.  ii.\n    tIf you choose to delete or we disable your account, these Terms shall terminate as an agreement between you and us but all clauses in this Terms of  Service dictating your data usage will still be in effect   LIMITS ON LIABILITY: We do not, won’t and can’t control or direct what people and others do or say in their usage of our products, and we are not responsible for their actions or conduct or any content they share whether offensive, inappropriate, obscene, unlawful, or otherwise objectionable.  Technology gets glitches or bugs and we cannot predict when issues might arise with our Products. Accordingly, our liability shall be limited to the fullest extent permitted by all applicable law, and under no circumstance will we be liable to you for any loss in revenue, profit, information, or data, or consequential, indirect, or incidental damages arising out of or related to these Terms of Service or the Infoage Solutions Limited Products, even if we have or had been advised of the possibility of such damages.  Our Products are provided \n    "as is,\n    " and we make no guarantees whatsoever that they will always be safe, secure, or error-free, or that they will function without disruptions, delays, or any imperfections. To the extent permitted by law, we also disclaim all warranties, whether expressed or implied, including the implied warranties of merchantability, fitness for a particular purpose, title, and non-infringement.  LEGAL DISPUTES: If you are a consumer of our Infoage Solutions Limited Products, the laws of the country in which you reside in will apply to your claim, cause of action, or dispute you might have against us that arises out of or relates to these Terms or the Infoage Solutions Limited Products, and you may resolve your claim in any competent court in that country that has jurisdiction over the claim. In all other cases, you agree that the claim must be resolved exclusively in The High Court of Kenya. You also agree that you submit to the jurisdiction of this court for the purpose of litigating any claim thereof, and that the laws of the Republic of Kenya will govern these Terms and any claim, without regard to conflict of law provisions.   NOTE: 1.\n    tIf any part of these Terms of Service is found to be unenforceable in a certain scenario, the remaining part will remain in full force and effect regardless. Should we fail or otherwise decide not to enforce any of these Terms or part of, it should not be interpreted as waiver.  Any waiver of these Terms will be, and must be made in writing and signed by Infoage Solutions Limited. 2.\n    tAll of our rights and obligations under these Terms are freely assignable in part or in totality by us in connection with any acquisitions, sale of assets, or a merger or any other business dealing that would in effect be classified under Infoage Solutions Limited Products. 3.\n    tYou should not, and will not transfer any of your rights or obligations under these Terms of Service to anyone else without our written consent. 4.\n    tWhile we appreciate your feedback and suggestions about our products and services, we are under no obligation to keep them confidential and therefore, without any restriction we may decide to use them without obligation to compensate you or give you credit. We simply reserve all rights that are not expressly granted to you.   Infoage Solutions Limited ',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  )
                ]),
              )),
              SizedBox(height: 10.0),
              Flexible(
                  child: Container(
                child: Row(children: <Widget>[
                  Text('I have read and agreed to the Terms'),
                  FlutterSwitch(
                    value: isSwitchOn,
                    activeColor: Color(0xFF8EBA43),
                    onToggle: (value) {
                      setState(() {
                        isSwitchOn = value;
                      });
                    },
                  ),
                ]),
              )),
              Container(
                margin: EdgeInsets.fromLTRB(28.0, 1.0, 32.0, 1.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF8EBc43),
                      onPrimary: Colors.black, // This is what you need!
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text("CONTINUE"),
                  ), //Color Of Icon),,
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      );
}
