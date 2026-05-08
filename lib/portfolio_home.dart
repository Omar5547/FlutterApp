import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: isMobile ? _buildDrawer() : null,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0A192F).withOpacity(0.85),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
              child: Row(
                children: [
                  Text(
                    'OE.',
                    style: GoogleFonts.outfit(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF64FFDA),
                    ),
                  ),
                  const Spacer(),
                  if (!isMobile) ...[
                    _navItem('Home', () => _scrollToSection(_heroKey)),
                    _navItem('About', () => _scrollToSection(_aboutKey)),
                    _navItem('Skills', () => _scrollToSection(_skillsKey)),
                    _navItem('Projects', () => _scrollToSection(_projectsKey)),
                    _navItem('Contact', () => _scrollToSection(_contactKey)),
                  ] else
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Color(0xFF64FFDA)),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(key: _heroKey),
            AboutSection(key: _aboutKey),
            SkillsSection(key: _skillsKey),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: _contactKey),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF112240),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: [
          _drawerItem('Home', () {
            Navigator.pop(context);
            _scrollToSection(_heroKey);
          }),
          _drawerItem('About', () {
            Navigator.pop(context);
            _scrollToSection(_aboutKey);
          }),
          _drawerItem('Skills', () {
            Navigator.pop(context);
            _scrollToSection(_skillsKey);
          }),
          _drawerItem('Projects', () {
            Navigator.pop(context);
            _scrollToSection(_projectsKey);
          }),
          _drawerItem('Contact', () {
            Navigator.pop(context);
            _scrollToSection(_contactKey);
          }),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFF64FFDA), fontSize: 18),
        textAlign: TextAlign.center,
      ),
      onTap: onTap,
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFE6F1FF),
          fontSize: 14,
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hi, my name is',
            style: TextStyle(
              color: Color(0xFF64FFDA),
              fontSize: 16,
              fontFamily: 'Inter',
            ),
          ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.2),
          const SizedBox(height: 10),
          Text(
            isMobile ? 'Omar\nMohammed' : 'Omar Mohammed\nNageb Elnagar',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: isMobile ? 40 : 70,
                  height: 1.1,
                ),
          ).animate().fadeIn(delay: 200.ms, duration: 500.ms).slideY(begin: 0.2),
          if (isMobile)
            Text(
              'Nageb Elnagar',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 40,
                    height: 1.1,
                    color: const Color(0xFF64FFDA),
                  ),
            ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: 10),
          Text(
            'Back-End .NET Developer',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: isMobile ? 30 : 60,
                  color: const Color(0xFF8892B0),
                ),
          ).animate().fadeIn(delay: 400.ms, duration: 500.ms).slideY(begin: 0.2),
          const SizedBox(height: 20),
          SizedBox(
            width: 540,
            child: Text(
              'Developing scalable applications with Clean Architecture and SOLID principles.',
              style: TextStyle(fontSize: isMobile ? 16 : 18),
            ),
          ).animate().fadeIn(delay: 600.ms, duration: 500.ms).slideY(begin: 0.2),
          const SizedBox(height: 50),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF64FFDA),
              side: const BorderSide(color: Color(0xFF64FFDA)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text('View My Work'),
          ).animate().fadeIn(delay: 800.ms, duration: 500.ms).scale(),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return _SectionContainer(
      index: '01',
      title: 'About Me',
      child: Column(
        children: [
          if (isMobile) ...[
            _buildProfileImage(),
            const SizedBox(height: 40),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'I am a Back-End .NET Developer with hands-on experience in ASP.NET Core, MVC, Web API, and Entity Framework. I specialize in building robust, scalable applications following best practices like Clean Architecture and SOLID principles.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'My expertise lies in designing RESTful APIs, managing complex databases with SQL Server, and ensuring high-performance server-side logic.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF112240),
                        borderRadius: BorderRadius.circular(8),
                        border: const Border(
                          left: BorderSide(color: Color(0xFF64FFDA), width: 3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Education',
                            style: GoogleFonts.outfit(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'B.Sc. In Computer Science',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'High Institute of Kafr El Sheikh University',
                            style: TextStyle(fontSize: 13),
                          ),
                          const Text(
                            'Grade: Good',
                            style: TextStyle(color: Color(0xFF64FFDA)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 50),
                Expanded(
                  flex: 2,
                  child: _buildProfileImage(),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF64FFDA), width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: const DecorationImage(
                image: AssetImage('assets/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF64FFDA).withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      index: '02',
      title: 'Technical Skills',
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        children: [
          _SkillCategory(
            title: 'Programming',
            skills: ['C#', 'ASP.NET Core', 'MVC', 'Web API', 'EF Core', 'LINQ'],
          ),
          _SkillCategory(
            title: 'Database & Tools',
            skills: ['SQL Server', 'REST APIs', 'Swagger', 'Postman'],
          ),
          _SkillCategory(
            title: 'Frontend',
            skills: ['HTML5', 'CSS3', 'JS', 'Bootstrap', 'jQuery'],
          ),
          _SkillCategory(
            title: 'Architecture',
            skills: ['Clean Architecture', 'SOLID', 'Git', 'VS'],
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      index: '03',
      title: 'Selected Projects',
      child: Column(
        children: [
          _ProjectCard(
            title: 'Talabat API',
            description: 'A RESTful API for food delivery management using Clean Architecture.',
            tags: ['ASP.NET Core', 'EF Core', 'SQL Server'],
            imagePath: 'assets/talabat.png',
          ),
          const SizedBox(height: 40),
          _ProjectCard(
            title: 'Inventory App',
            description: 'Complete system for managing products, sales, and customers.',
            tags: ['MVC', 'EF Core', 'Razor'],
            imagePath: 'assets/inventory.png',
            isReversed: true,
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return _SectionContainer(
      index: '04',
      title: 'Get In Touch',
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'I am currently looking for new opportunities.',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                _contactItem(Icons.email, 'omarnageb22@gmail.com'),
                _contactItem(Icons.phone, '+20 106 466 4467'),
                _contactItem(Icons.location_on, 'Cairo, Egypt'),
                const SizedBox(height: 30),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.linkedin)),
                    IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.github)),
                  ],
                ),
              ],
            ),
          ),
          if (isMobile) const SizedBox(height: 50),
          if (!isMobile) const SizedBox(width: 50),
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              children: [
                _textField('Your Name'),
                const SizedBox(height: 15),
                _textField('Your Email'),
                const SizedBox(height: 15),
                _textField('Your Message', maxLines: 5),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF64FFDA),
                      foregroundColor: const Color(0xFF0A192F),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: const Text('Send Message'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF64FFDA), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _textField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFF112240),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0xFF64FFDA)),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      color: const Color(0xFF020C1B),
      child: Column(
        children: [
          Text(
            'Designed & Built by Omar Elnagar © 2026',
            style: GoogleFonts.inter(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  final String index;
  final String title;
  final Widget child;

  const _SectionContainer({
    required this.index,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '$index.',
                style: GoogleFonts.outfit(
                  color: const Color(0xFF64FFDA),
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: isMobile ? 24 : 32,
                    ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xFF233554),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 40),
          child,
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;

  const _SkillCategory({required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFE6F1FF),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((skill) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF112240),
                        border: Border.all(color: const Color(0xFF233554)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        skill,
                        style: const TextStyle(
                          color: Color(0xFF64FFDA),
                          fontSize: 10,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> tags;
  final String imagePath;
  final bool isReversed;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tags,
    required this.imagePath,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    if (isMobile) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF112240),
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 10),
                  Text(description, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 10,
                    children: tags.map((t) => Text(t, style: const TextStyle(fontSize: 11, color: Color(0xFF64FFDA)))).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: 320,
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: isReversed
            ? [
                _buildInfo(),
                _buildImage(),
              ]
            : [
                _buildImage(),
                _buildInfo(),
              ],
      ),
    ).animate().fadeIn().slideY(begin: 0.1);
  }

  Widget _buildImage() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFE6F1FF),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 15,
              children: tags
                  .map((tag) => Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64FFDA),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 30),
            const FaIcon(FontAwesomeIcons.github, size: 20),
          ],
        ),
      ),
    );
  }
}
